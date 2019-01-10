/**
  ******************************************************************************
  * File Name          : main.c
  * Description        : Main program body
  ******************************************************************************
  *
  * Copyright (c) 2017 STMicroelectronics International N.V. 
  * All rights reserved.
  *
  * Redistribution and use in source and binary forms, with or without 
  * modification, are permitted, provided that the following conditions are met:
  *
  * 1. Redistribution of source code must retain the above copyright notice, 
  *    this list of conditions and the following disclaimer.
  * 2. Redistributions in binary form must reproduce the above copyright notice,
  *    this list of conditions and the following disclaimer in the documentation
  *    and/or other materials provided with the distribution.
  * 3. Neither the name of STMicroelectronics nor the names of other 
  *    contributors to this software may be used to endorse or promote products 
  *    derived from this software without specific written permission.
  * 4. This software, including modifications and/or derivative works of this 
  *    software, must execute solely and exclusively on microcontroller or
  *    microprocessor devices manufactured by or for STMicroelectronics.
  * 5. Redistribution and use of this software other than as permitted under 
  *    this license is void and will automatically terminate your rights under 
  *    this license. 
  *
  * THIS SOFTWARE IS PROVIDED BY STMICROELECTRONICS AND CONTRIBUTORS "AS IS" 
  * AND ANY EXPRESS, IMPLIED OR STATUTORY WARRANTIES, INCLUDING, BUT NOT 
  * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A 
  * PARTICULAR PURPOSE AND NON-INFRINGEMENT OF THIRD PARTY INTELLECTUAL PROPERTY
  * RIGHTS ARE DISCLAIMED TO THE FULLEST EXTENT PERMITTED BY LAW. IN NO EVENT 
  * SHALL STMICROELECTRONICS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
  * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
  * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, 
  * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF 
  * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING 
  * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
  * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  *
  ******************************************************************************
  */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "stm32l0xx_hal.h"
#include "cmsis_os.h"

/* USER CODE BEGIN Includes */
#include "inittriglut.h"
#include <stdlib.h>
/* USER CODE END Includes */

/* Private variables ---------------------------------------------------------*/
RTC_HandleTypeDef hrtc;

SPI_HandleTypeDef hspi1;
DMA_HandleTypeDef hdma_spi1_tx;

osThreadId defaultTaskHandle;

/* USER CODE BEGIN PV */
/* Private variables ---------------------------------------------------------*/
#define SCREEN_WIDTH	128
#define SCREEN_HEIGHT	128

volatile uint8_t data[SCREEN_HEIGHT * ((SCREEN_WIDTH >> 3) + 2)];
const uint8_t command[1] = {0x03};
const uint8_t clear_cmd[2] = {0x05, 0x00};

RTC_TimeTypeDef sTimeStamp;
RTC_DateTypeDef sDateStamp;
HAL_RTCStateTypeDef currentState;

uint8_t hours = 12, minutes = 01, seconds = 30;

typedef enum {
	false = 0U,
	true = 1U
} bool;

typedef void (*drawFuncDef)(uint8_t, uint8_t);
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
void Error_Handler(void);
static void MX_GPIO_Init(void);
static void MX_DMA_Init(void);
static void MX_SPI1_Init(void);
static void MX_RTC_Init(void);
void StartDefaultTask(void const * argument);

/* USER CODE BEGIN PFP */
/* Private function prototypes -----------------------------------------------*/

/* USER CODE END PFP */

/* USER CODE BEGIN 0 */
static void setPixel(uint8_t x, uint8_t y) {
	if (x > 127 || y > 127) return;
	/*x %= 128;
	y %= 128;*/
	data[(y*((SCREEN_WIDTH>>3)+2))+(x>>3)+1] &= ~(1 << (x % 8));
}

static void clearPixel(uint8_t x, uint8_t y) {
	if (x > 127 || y > 127) return;
	/*x %= 128;
	y %= 128;*/
	data[(y*((SCREEN_WIDTH>>3)+2))+(x>>3)+1] |= (1 << (x % 8));
}

void clearDisplay() {
	for(uint8_t dy=0; dy<SCREEN_HEIGHT; dy++) {
		for(uint8_t dx=0; dx<SCREEN_WIDTH; dx++) {
			setPixel(dx,dy);
		}
	}
}

static drawFuncDef otherFunction(const drawFuncDef func) {
	if (func == setPixel) return clearPixel;
	else return setPixel;
}

static void drawCircle(uint8_t x0, uint8_t y0, uint8_t radius, const drawFuncDef drawFunc) {
	int x = radius;
	int y = 0;
	int err = 0;
	while (x >= y) {
		drawFunc(x0 + x, y0 + y);
		drawFunc(x0 + y, y0 + x);
		drawFunc(x0 - y, y0 + x);
		drawFunc(x0 - x, y0 + y);
		drawFunc(x0 - x, y0 - y);
		drawFunc(x0 - y, y0 - x);
		drawFunc(x0 + y, y0 - x);
		drawFunc(x0 + x, y0 - y);

		y += 1;
		err += 1 + (y << 2);
		if (((err-x) << 2) + 1 > 0) {
			x -= 1;
			err += 1 - (x << 2);
		}
	}
}

// source: https://rosettacode.org/wiki/Bitmap/Bresenham%27s_line_algorithm#C
static void drawLine(uint8_t x0, uint8_t y0, uint8_t x1, uint8_t y1, const drawFuncDef drawFunc) {
	int dx = abs(x1-x0), sx = x0 < x1 ? 1 : -1;
	int dy = abs(y1-y0), sy = y0 < y1 ? 1 : -1;
	int err = (dx > dy ? dx : -dy)/2, e2;

	for (;;) {
		drawFunc(x0,y0);
		if (x0==x1 && y0==y1) break;
		e2 = err;
		if (e2 > -dx)	{ err -= dy; x0 += sx; }
		if (e2 < dy)	{ err += dx; y0 += sy; }
	}
}

static void drawRect(uint8_t x1, uint8_t y1, uint8_t w, uint8_t h, const drawFuncDef drawFunc) {
	drawLine(x1,y1,x1+w,y1,drawFunc);
	drawLine(x1,y1,x1,y1+h,drawFunc);
	drawLine(x1,y1+h,x1+w,y1+h,drawFunc);
	drawLine(x1+w,y1,x1+w,y1+h,drawFunc);
}

static void drawArc(uint8_t x0, uint8_t y0, uint8_t radius, int16_t start, int16_t end, const drawFuncDef drawFunc) {
	for(int16_t theta=start+1; theta<end; theta++) {
		int32_t _x1 = x0 + radius * i16_cos(theta-1) / 32768;
		int32_t _y1 = y0 + radius * i16_sin(theta-1) / 32768;
		int32_t _x2 = x0 + radius * i16_cos(theta) / 32768;
		int32_t _y2 = y0 + radius * i16_sin(theta) / 32768;
		//drawFunc((uint8_t)_x, (uint8_t)_y);
		drawLine(_x1, _y1, _x2, _y2, drawFunc);
	}
}

static void drawRoundedRect(uint8_t x1, uint8_t y1, uint8_t w, uint8_t h, uint8_t r, const drawFuncDef drawFunc) {
	drawLine(x1+r,y1,x1+w-r,y1,drawFunc);
	drawLine(x1,y1+r,x1,y1+h-r,drawFunc);
	drawLine(x1+r,y1+h,x1+w-r,y1+h,drawFunc);
	drawLine(x1+w,y1+r,x1+w,y1+h-r,drawFunc);

	drawArc(x1+r,y1+r,r,180,270,drawFunc);
	drawArc(x1+w-r,y1+r,r,-90,0,drawFunc);
	drawArc(x1+r,y1+h-r,r,90,180,drawFunc);
	drawArc(x1+w-r,y1+h-r,r,0,90,drawFunc);
}
/*
static void drawChar8(uint8_t x, uint8_t y, char c, bool bg, const drawFuncDef drawFunc) {
	uint16_t n = c - ' ';
	drawFuncDef other = otherFunction(drawFunc);

	for (uint8_t i=0; i<16; i++) {
		for(uint8_t j=0; j<8; j++) {
			if  ((font8x16[(n*16)+i] >> (7-j)) & 0x01) {
				setPixel((x+j)%SCREEN_WIDTH, (y+i)%SCREEN_HEIGHT);
			}
			else {
				if (bg) other((x+j)%SCREEN_WIDTH, (y+i)%SCREEN_HEIGHT);
			}
		}
	}
}

static void drawChar32(uint8_t x, uint8_t y, char c, bool bg, const drawFuncDef drawFunc) {
	uint16_t n = c - '0';
	drawFuncDef other = otherFunction(drawFunc);
	if (n > 10) n = 11;

	for(uint8_t i=0; i<29; i++) {
		for(uint8_t j=0; j<24; j++) {
			if ((font24x29[(n*29)+i] >> (23-j)) & (uint32_t)0x01) {
				drawFunc((x+j)%SCREEN_WIDTH, (y+i)%SCREEN_HEIGHT);
			}
			else {
				if (bg) other((x+j)%SCREEN_WIDTH, (y+i)%SCREEN_HEIGHT);
			}
		}
	}
}

static void drawStr8(uint8_t x, uint8_t y, char str[], bool bg, const drawFuncDef drawFunc) {
	char *c = NULL;
	uint8_t x0 = x;
	for(c = str; *c != '\0'; c++) {
		if (*c == '\n') {
			y += 16;
			x = x0;
		}
		else {
			drawChar8(x, y, *c, bg, drawFunc);
			x += 8;
		}
	}
}

static void drawStr24(uint8_t x, uint8_t y, char str[], bool bg, const drawFuncDef drawFunc) {
	char *c = NULL;
	for(c = str; *c != '\0'; c++) {
		drawChar32(x, y, *c, bg, drawFunc);
		x += 24;
	}
}*/
/* USER CODE END 0 */

int main(void)
{

  /* USER CODE BEGIN 1 */
	for(uint8_t i=0; i<SCREEN_HEIGHT; i++) {
			data[i*((SCREEN_WIDTH >> 3)+2)] = i+1;
			data[(i+1)*((SCREEN_WIDTH>>3)+2)-1] = 0x00;
		}
  /* USER CODE END 1 */

  /* MCU Configuration----------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* Configure the system clock */
  SystemClock_Config();

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_DMA_Init();
  MX_SPI1_Init();
  MX_RTC_Init();

  /* USER CODE BEGIN 2 */
  HAL_SuspendTick();
  HAL_PWREx_EnableLowPowerRunMode();

  updateDisplay();
  /* USER CODE END 2 */

  /* USER CODE BEGIN RTOS_MUTEX */
  /* add mutexes, ... */
  /* USER CODE END RTOS_MUTEX */

  /* USER CODE BEGIN RTOS_SEMAPHORES */
  /* add semaphores, ... */
  /* USER CODE END RTOS_SEMAPHORES */

  /* USER CODE BEGIN RTOS_TIMERS */
  /* start timers, add new ones, ... */
  /* USER CODE END RTOS_TIMERS */

  /* Create the thread(s) */
  /* definition and creation of defaultTask */
  /*osThreadDef(defaultTask, StartDefaultTask, osPriorityNormal, 0, 128);
  defaultTaskHandle = osThreadCreate(osThread(defaultTask), NULL);*/

  /* USER CODE BEGIN RTOS_THREADS */
  /* add threads, ... */
  /* USER CODE END RTOS_THREADS */

  /* USER CODE BEGIN RTOS_QUEUES */
  /* add queues, ... */
  /* USER CODE END RTOS_QUEUES */
 

  /* Start scheduler */
  osKernelStart();
  
  /* We should never get here as control is now taken by the scheduler */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
  /* USER CODE END WHILE */

  /* USER CODE BEGIN 3 */

  }
  /* USER CODE END 3 */

}

/** System Clock Configuration
*/
void SystemClock_Config(void)
{

  RCC_OscInitTypeDef RCC_OscInitStruct;
  RCC_ClkInitTypeDef RCC_ClkInitStruct;
  RCC_PeriphCLKInitTypeDef PeriphClkInit;

    /**Configure the main internal regulator output voltage 
    */
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE2);

    /**Initializes the CPU, AHB and APB busses clocks 
    */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_LSE|RCC_OSCILLATORTYPE_MSI;
  RCC_OscInitStruct.LSEState = RCC_LSE_ON;
  RCC_OscInitStruct.MSIState = RCC_MSI_ON;
  RCC_OscInitStruct.MSICalibrationValue = 0;
  RCC_OscInitStruct.MSIClockRange = RCC_MSIRANGE_5;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_NONE;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

    /**Initializes the CPU, AHB and APB busses clocks 
    */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_MSI;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_0) != HAL_OK)
  {
    Error_Handler();
  }

  PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_RTC;
  PeriphClkInit.RTCClockSelection = RCC_RTCCLKSOURCE_LSE;
  if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
  {
    Error_Handler();
  }

    /**Configure LSE Drive Capability 
    */
  __HAL_RCC_LSEDRIVE_CONFIG(RCC_LSEDRIVE_LOW);

    /**Configure the Systick interrupt time 
    */
  HAL_SYSTICK_Config(HAL_RCC_GetHCLKFreq()/1000);

    /**Configure the Systick 
    */
  HAL_SYSTICK_CLKSourceConfig(SYSTICK_CLKSOURCE_HCLK);

  /* SysTick_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(SysTick_IRQn, 3, 0);
}

/* RTC init function */
static void MX_RTC_Init(void)
{

  RTC_TimeTypeDef sTime;
  RTC_DateTypeDef sDate;

    /**Initialize RTC Only 
    */
  hrtc.Instance = RTC;
  hrtc.Init.HourFormat = RTC_HOURFORMAT_24;
  hrtc.Init.AsynchPrediv = 127;
  hrtc.Init.SynchPrediv = 255;
  hrtc.Init.OutPut = RTC_OUTPUT_DISABLE;
  hrtc.Init.OutPutRemap = RTC_OUTPUT_REMAP_NONE;
  hrtc.Init.OutPutPolarity = RTC_OUTPUT_POLARITY_HIGH;
  hrtc.Init.OutPutType = RTC_OUTPUT_TYPE_OPENDRAIN;
  if (HAL_RTC_Init(&hrtc) != HAL_OK)
  {
    Error_Handler();
  }

    /**Initialize RTC and set the Time and Date 
    */
  sTime.Hours = 0x0;
  sTime.Minutes = 0x0;
  sTime.Seconds = 0x0;
  sTime.DayLightSaving = RTC_DAYLIGHTSAVING_NONE;
  sTime.StoreOperation = RTC_STOREOPERATION_RESET;
  if (HAL_RTC_SetTime(&hrtc, &sTime, RTC_FORMAT_BCD) != HAL_OK)
  {
    Error_Handler();
  }

  sDate.WeekDay = RTC_WEEKDAY_MONDAY;
  sDate.Month = RTC_MONTH_JANUARY;
  sDate.Date = 0x1;
  sDate.Year = 0x0;

  if (HAL_RTC_SetDate(&hrtc, &sDate, RTC_FORMAT_BCD) != HAL_OK)
  {
    Error_Handler();
  }

    /**Enable the WakeUp 
    */
  if (HAL_RTCEx_SetWakeUpTimer_IT(&hrtc, 59, RTC_WAKEUPCLOCK_CK_SPRE_16BITS) != HAL_OK)
  {
    Error_Handler();
  }

}

/* SPI1 init function */
static void MX_SPI1_Init(void)
{

  hspi1.Instance = SPI1;
  hspi1.Init.Mode = SPI_MODE_MASTER;
  hspi1.Init.Direction = SPI_DIRECTION_2LINES;
  hspi1.Init.DataSize = SPI_DATASIZE_8BIT;
  hspi1.Init.CLKPolarity = SPI_POLARITY_LOW;
  hspi1.Init.CLKPhase = SPI_PHASE_1EDGE;
  hspi1.Init.NSS = SPI_NSS_SOFT;
  hspi1.Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_2;
  hspi1.Init.FirstBit = SPI_FIRSTBIT_LSB;
  hspi1.Init.TIMode = SPI_TIMODE_DISABLE;
  hspi1.Init.CRCCalculation = SPI_CRCCALCULATION_DISABLE;
  hspi1.Init.CRCPolynomial = 7;
  if (HAL_SPI_Init(&hspi1) != HAL_OK)
  {
    Error_Handler();
  }

}

/** 
  * Enable DMA controller clock
  */
static void MX_DMA_Init(void) 
{
  /* DMA controller clock enable */
  __HAL_RCC_DMA1_CLK_ENABLE();

  /* DMA interrupt init */
  /* DMA1_Channel2_3_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(DMA1_Channel2_3_IRQn, 3, 0);
  HAL_NVIC_EnableIRQ(DMA1_Channel2_3_IRQn);

}

/** Configure pins as 
        * Analog 
        * Input 
        * Output
        * EVENT_OUT
        * EXTI
*/
static void MX_GPIO_Init(void)
{

  GPIO_InitTypeDef GPIO_InitStruct;

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOC_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOA, EXTCOMIN_Pin|LCD_SCS_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(LED_GPIO_Port, LED_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pins : PB_TOP_Pin PB_MID_Pin PB_LOW_Pin */
  GPIO_InitStruct.Pin = PB_TOP_Pin|PB_MID_Pin|PB_LOW_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_IT_FALLING;
  GPIO_InitStruct.Pull = GPIO_PULLUP;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  /*Configure GPIO pins : EXTCOMIN_Pin LCD_SCS_Pin */
  GPIO_InitStruct.Pin = EXTCOMIN_Pin|LCD_SCS_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_PULLDOWN;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  /*Configure GPIO pin : LED_Pin */
  GPIO_InitStruct.Pin = LED_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_PULLDOWN;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(LED_GPIO_Port, &GPIO_InitStruct);

  /* EXTI interrupt init*/
  HAL_NVIC_SetPriority(EXTI0_1_IRQn, 3, 0);
  HAL_NVIC_EnableIRQ(EXTI0_1_IRQn);

  HAL_NVIC_SetPriority(EXTI2_3_IRQn, 3, 0);
  HAL_NVIC_EnableIRQ(EXTI2_3_IRQn);

}

/* USER CODE BEGIN 4 */
void vApplicationIdleHook(void) {
	HAL_PWR_EnterSLEEPMode(PWR_MAINREGULATOR_ON, PWR_SLEEPENTRY_WFE);
	//HAL_PWREx_EnableLowPowerRunMode()
	//HAL_PWREx_EnableUltraLowPower()
}

void updateDisplay() {
	clearDisplay();

		  		drawRoundedRect(1,1,126,126,8,clearPixel);
		  		// 12 line
		  		drawLine(63,3,63,14,clearPixel);
		  		drawLine(64,3,64,14,clearPixel);
		  		// 6 line
		  		drawLine(63,113,63,124,clearPixel);
		  		drawLine(64,113,64,124,clearPixel);
		  		// 9 line
		  		drawLine(3,63,14,63,clearPixel);
		  		drawLine(3,64,14,64,clearPixel);
		  		// 3 line
		  		drawLine(113,63,124,63,clearPixel);
		  		drawLine(113,64,124,64,clearPixel);
		  		// 1 line
		  		drawLine(92,13,99,3,clearPixel);
		  		drawLine(92,14,98,3,clearPixel);
		  		// 2 line
		  		drawLine(113,35,124,29,clearPixel);
		  		drawLine(114,35,124,30,clearPixel);
		  		// 5 line
		  		drawLine(92,114,99,124,clearPixel);
		  		drawLine(92,113,98,124,clearPixel);
		  		// 4 line
		  		drawLine(113,92,124,98,clearPixel);
		  		drawLine(114,93,124,99,clearPixel);
		  		// 11 line
		  		drawLine(35,14,29,3,clearPixel);
		  		drawLine(35,13,28,3,clearPixel);
		  		// 10 line
		  		drawLine(14,34,3,29,clearPixel);
		  		drawLine(14,35,3,28,clearPixel);
		  		// 8 line
		  		drawLine(14,92,3,99,clearPixel);
		  		drawLine(14,93,3,98,clearPixel);
		  		// 7 line
		  		drawLine(34,113,29,124,clearPixel);
		  		drawLine(35,113,28,124,clearPixel);

		  		// hour hand
		  		int16_t angle_hour = hours*360/12 + (minutes/2) - 90;
		  		drawLine(64,64,64+35*i16_cos(angle_hour)/32768,64+35*i16_sin(angle_hour)/32768,clearPixel);

		  		// minute hand
		  		int16_t angle_minute = minutes*360/60 - 90;
		  		drawLine(64,64,64+46*i16_cos(angle_minute)/32768,64+52*i16_sin(angle_minute)/32768,clearPixel);

		  		// second hand
		  		/*
		  		int16_t angle_second = seconds * 360 / 60 - 90;
		  		drawLine(64,64,64+62*i16_cos(angle_second)/32768, 64+62*i16_sin(angle_second)/32768,clearPixel);*/


		  		// Send frame
		  		HAL_GPIO_WritePin(LCD_SCS_GPIO_Port, LCD_SCS_Pin, GPIO_PIN_SET);

		  		HAL_SPI_Transmit(&hspi1, (uint8_t*)command, 1, HAL_MAX_DELAY);
		  		//HAL_SPI_Transmit(&hspi1, data, SCREEN_HEIGHT * ((SCREEN_WIDTH >> 3) + 2), HAL_MAX_DELAY);
		  		HAL_SPI_Transmit_DMA(&hspi1, data, SCREEN_HEIGHT * ((SCREEN_WIDTH >> 3) + 2));
		  		HAL_SPI_Transmit(&hspi1, 0x00, 1, HAL_MAX_DELAY);
}
/* USER CODE END 4 */

/* StartDefaultTask function */
void StartDefaultTask(void const * argument)
{

  /* USER CODE BEGIN 5 */
  /* Infinite loop */
  for(;;)
  {




    osDelay(25);
  }
  /* USER CODE END 5 */ 
}

/**
  * @brief  Period elapsed callback in non blocking mode
  * @note   This function is called  when TIM2 interrupt took place, inside
  * HAL_TIM_IRQHandler(). It makes a direct call to HAL_IncTick() to increment
  * a global variable "uwTick" used as application time base.
  * @param  htim : TIM handle
  * @retval None
  */
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
/* USER CODE BEGIN Callback 0 */

/* USER CODE END Callback 0 */
  if (htim->Instance == TIM2) {
    HAL_IncTick();
  }
/* USER CODE BEGIN Callback 1 */

/* USER CODE END Callback 1 */
}

/**
  * @brief  This function is executed in case of error occurrence.
  * @param  None
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler */
  /* User can add his own implementation to report the HAL error return state */
  while(1) 
  {
  }
  /* USER CODE END Error_Handler */ 
}

#ifdef USE_FULL_ASSERT

/**
   * @brief Reports the name of the source file and the source line number
   * where the assert_param error has occurred.
   * @param file: pointer to the source file name
   * @param line: assert_param error line source number
   * @retval None
   */
void assert_failed(uint8_t* file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
    ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */

}

#endif

/**
  * @}
  */ 

/**
  * @}
*/ 

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
