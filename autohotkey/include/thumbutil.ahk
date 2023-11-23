;; IME operation and Shift
*F14::
  Send,{Blind}{LShift Down}
  KeyWait,F14
  Send,{LShift Up}
  if (A_PriorKey = "F14" and A_TimeSinceThisHotkey < 200)
  {
    Send,{vk1D}
  }
  Return
*F15::
  Send,{Blind}{RShift Down}
  KeyWait,F15
  Send,{RShift Up}
  if (A_PriorKey = "F15" and A_TimeSinceThisHotkey < 200)
  {
    Send,{vk1C}
  }
  Return
