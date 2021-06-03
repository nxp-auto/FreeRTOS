/*
 * Copyright 2019 NXP.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 */

#include <FreeRTOS.h>
#include <task.h>

#define MAIN_PRIORITY                ( tskIDLE_PRIORITY + 2 )
volatile uint32_t ui32_ms_cnt = 0;
volatile uint32_t task_1 = 0;
volatile uint32_t task_2 = 0;


void vTask1( void *pvParameters )
{
    unsigned int ID = (unsigned int)pvParameters;

    for( ;; ) {
        task_1 ++;
        vTaskDelay( 1000 + ID);
    }
}

void vTask2( void *pvParameters )
{
    unsigned int ID = (unsigned int)pvParameters;

    for( ;; ) {
        task_2 ++;
        vTaskDelay( 1000 + ID );
    }
}
int main(void)
{
	xTaskCreate( vTask1, ( const char * const ) "Task1", configMINIMAL_STACK_SIZE, (void*)0x0, MAIN_PRIORITY, NULL);
    xTaskCreate( vTask2, ( const char * const ) "Task2", configMINIMAL_STACK_SIZE, (void*)0x1, MAIN_PRIORITY, NULL);
	vTaskStartScheduler();
	
	while (1) {
	}
	return 0;
}

void vAssertCalled(uint32_t ulLine, const char *pcFile)
{

}

void vApplicationStackOverflowHook(xTaskHandle pxTask, char *pcTaskName)
{

}

void vApplicationTickHook(void)
{
	ui32_ms_cnt ++;
}

void vApplicationMallocFailedHook(void)
{

}