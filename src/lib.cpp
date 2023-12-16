#include <pico/stdlib.h>

#include "ProjectName/lib.hpp"


namespace someNamespace
{

void initLed()
{
    gpio_init(25);
    gpio_set_dir(25, GPIO_OUT);
}

void blinkLed(bool value)
{
    gpio_put(25, value);
}

}
