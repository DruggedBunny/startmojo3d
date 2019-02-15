
#Import "<std>"
#Import "<mojo>"
#Import "<mojo3d>"

Using std..
Using mojo..
Using mojo3d..

Class MyGame Extends Window
	
	Field scene:Scene
	Field camera:Camera
	
	Field cube:Model
	
	Method New  (title:String = "My Game", width:Int = 640, height:Int = 480, flags:WindowFlags = WindowFlags.Resizable)
		Super.New (title, width, height, flags)
	End
	
	Method OnCreateWindow () Override
		
		scene						= New Scene
		camera						= New Camera (Self)
		
		Local cube_box:Boxf			= New Boxf (-0.5, -0.5, -0.5, 0.5, 0.5, 0.5)
		Local cube_mat:PbrMaterial	= New PbrMaterial (Color.White)
		
		cube						= Model.CreateBox (cube_box, 1, 1, 1, cube_mat)
		
			cube.Move (0, 0, 5)
			
	End
	
	Method OnRender (canvas:Canvas) Override
		
		cube.Rotate (1, 2, 4)
		
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
