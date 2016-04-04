void task_reset1()
{
    analogWrite(right_frwd,255);
    analogWrite(left_frwd,50);
    analogWrite(omni_right_frwd,255);
    analogWrite(omni_left_frwd,50);
    delay(400);
    stop_bot();
     analogWrite(right_frwd,100);
    analogWrite(left_frwd,255);
    analogWrite(omni_right_frwd,100);
    analogWrite(omni_left_frwd,255);
    delay(600);
    stop_bot();
    delay(100);
}
