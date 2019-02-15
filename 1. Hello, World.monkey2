
#Import "<std>"
#Import "<mojo>"
#Import "<mojo3d>"

Using std..
Using mojo..
Using mojo3d..

Class MyGame Extends Window
	
	Field scene:Scene
	Field camera:Camera
	
	Method New  (title:String = "My Game", width:Int = 640, height:Int = 480, flags:WindowFlags = WindowFlags.Resizable)
		Super.New (title, width, height, flags)
	End
	
	Method OnCreateWindow () Override
		
		scene				= New Scene
		camera				= New Camera (Self)
		
	End
	
	Method OnRender (canvas:Canvas) Override
		
		If Keyboard.KeyHit (Key.Escape) Then App.Terminate ()
		
		RequestRender ()
		
		scene.Update ()
		camera.Render (canvas)
		
	End
	
End

Function Main ()

	New AppInstance
	New MyGame
	
	App.Run ()
	
End
