require 'java'
require ARGV[1]
import org.jnativehook.GlobalScreen;
import org.jnativehook.keyboard.NativeKeyEvent;
import org.jnativehook.keyboard.NativeKeyListener;

class KeyHook
  include NativeKeyListener
  def nativeKeyPressed(e)
    code =  e.getKeyCode()
    if code == 28 then
      system("afplay " + Dir.glob(ARGV[0]+'*').choice)
    elsif code == 1 then
      java.lang.System.exit(0)
    end
  end
  def nativeKeyReleased(e)
  end
  def nativeKeyTyped(e)
  end
end

GlobalScreen.registerNativeHook
GlobalScreen.getInstance.addNativeKeyListener(KeyHook.new)