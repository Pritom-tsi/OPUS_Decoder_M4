################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Application/Startup/startup_stm32l552zetx.s 

OBJS += \
./Application/Startup/startup_stm32l552zetx.o 

S_DEPS += \
./Application/Startup/startup_stm32l552zetx.d 


# Each subdirectory must supply rules for building sources it contributes
Application/Startup/startup_stm32l552zetx.o: ../Application/Startup/startup_stm32l552zetx.s
	arm-none-eabi-gcc -mcpu=cortex-m33 -g3 -c -x assembler-with-cpp -MMD -MP -MF"Application/Startup/startup_stm32l552zetx.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

