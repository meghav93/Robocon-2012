void task_reset_2()
{
    forward();
    while(analogReadavg(15)<300);
    stop_bot();
    delay(100);
}
