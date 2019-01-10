################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM0/port.c 

OBJS += \
./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM0/port.o 

C_DEPS += \
./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM0/port.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM0/%.o: ../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM0/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft -D__weak="__attribute__((weak))" -D__packed="__attribute__((__packed__))" -DUSE_HAL_DRIVER -DSTM32L051xx -I"/home/ramon/Projects/Ac6/L051_Watch/Inc" -I"/home/ramon/Projects/Ac6/L051_Watch/Drivers/STM32L0xx_HAL_Driver/Inc" -I"/home/ramon/Projects/Ac6/L051_Watch/Drivers/STM32L0xx_HAL_Driver/Inc/Legacy" -I"/home/ramon/Projects/Ac6/L051_Watch/Drivers/CMSIS/Device/ST/STM32L0xx/Include" -I"/home/ramon/Projects/Ac6/L051_Watch/Drivers/CMSIS/Include" -I"/home/ramon/Projects/Ac6/L051_Watch/Inc" -I"/home/ramon/Projects/Ac6/L051_Watch/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM0" -I"/home/ramon/Projects/Ac6/L051_Watch/Middlewares/Third_Party/FreeRTOS/Source/include" -I"/home/ramon/Projects/Ac6/L051_Watch/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


