#include <pico/stdlib.h>

#include "ProjectName/lib.hpp"


int main()
{
    someNamespace::initLed();

    while(true)
    {
        someNamespace::blinkLed(true);
        sleep_ms(1000);
        someNamespace::blinkLed(false);
        sleep_ms(1000);
    }

    return 0;
}
