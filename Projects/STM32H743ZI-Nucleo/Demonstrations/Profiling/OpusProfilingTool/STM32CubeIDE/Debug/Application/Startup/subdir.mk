################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Application/Startup/startup_stm32h743zitx.s 

OBJS += \
./Application/Startup/startup_stm32h743zitx.o 

S_DEPS += \
./Application/Startup/startup_stm32h743zitx.d 


# Each subdirectory must supply rules for building sources it contributes
Application/Startup/startup_stm32h743zitx.o: ../Application/Startup/startup_stm32h743zitx.s
	arm-none-eabi-gcc -mcpu=cortex-m7 -g3 -c -x assembler-with-cpp -MMD -MP -MF"Application/Startup/startup_stm32h743zitx.d" -MT"$@"  -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

