
scene1Time = 5

function Scene1()

    BeginCommandGroup("CameraInit","Parallel")

        BindGameObject("Falcon")
        MoveWithTime(4,-1,0,0)
        RotateWithTime(0,-80,-90,0)

        BindGameObject("Camera")
        MoveWithTime(0,0,5,0)

        --WaitForSeconds(0.01)

        --FollowObject("Falcon",10).SetSimpleFollow(1).SetMaxSpeed(20).SetFollowAxis(1,0,0)
       

        --FollowCurveWithTime(6).AddPoint(139,2,346, 0,0,-20,  90,0,0)
        --.AddPoint(80,2,346, 0,0,-20 ,-90,0,0)
        --.AddPoint(10,2,346, 0,0,20 ,0,0,0)
        
       
        --.LookAtCurve(1).LookAtOffset(0,-75,-90)
    EndCommandGroup("CameraInit")

       
    BeginCommandGroup("FalconInit", "Serial")

        --FollowCurveWithTime(5).AddPoint(0,0,0  0,1,0,  0,0,0)
        --.AddPoint(2,1,0,  0,0,0, 0,0,0)

        BindGameObject("Falcon")
        FollowCurveWithTime(0.5).AddPoint(4,-1,0, 0,1,0)
        .AddPoint(2.7,0,0, 1,0,0)

        FollowCurveWithTime(0.8).AddPoint(2.7,0,0, 0,0,0 ,0,0,0)
        .AddPoint(0.5,0,3.5, 0,0,0, 0,50,0)
        .LookAtCurve(1).LookAtOffset(-180,-110,90)


        FollowCurveWithTime(1).AddPoint(0.5,0,3.5, 0,0,0, 0,-80,0)
        .AddPoint(-1,0,2, 0,0,0,  0,0,0)
        .LookAtCurve(1).LookAtOffset(-180,-110,90)

        

        --.AddPoint(10,2,346, 0,0,20 ,0,0,0)

    EndCommandGroup("Falcon")

    BeginCommandGroup("FalconFade", "Parallel")

        WaitForSeconds(3)

        MoveWithSpeed(-8,0,2,1)
        RotateWithTime(0,-80,-90,2)

    EndCommandGroup("FalconFade")

    BeginCommandGroup("Asteroid Spawn", "Parallel")

        SpawnGameObject("Asteroid","Asteroid1" , 2);

        WaitForSeconds(0.01)
        BindGameObject("Asteroid1")
        MoveWithTime(0,0,-7,0)
        RotateWithTime(0,90,0,0)
        WaitForSeconds(0.01)
        MoveWithSpeed(10,0,-3,0.1)

        SpawnGameObject("Asteroid","Asteroid2" , 2);
        WaitForSeconds(0.01)
        BindGameObject("Asteroid2")
        MoveWithTime(-8,-1,1,0)
        RotateWithTime(0,-90,0,0)
        MoveWithSpeed(10,1,-4,0.15)

        WaitForSeconds(0.01)
        SpawnGameObject("Asteroid","Asteroid3" , 0);
        BindGameObject("Asteroid3")
        MoveWithTime(-3,0,0,0)
        RotateWithTime(0,90,0,0)
        MoveWithSpeed(10,0,-3,0.1)

        SpawnGameObject("Asteroid","Asteroid4" , 2);
        WaitForSeconds(0.01)
        BindGameObject("Asteroid4")
        MoveWithTime(-15,0,-7,0)
        RotateWithTime(0,90,0,0)
        WaitForSeconds(0.01)
        MoveWithSpeed(10,0,-3,0.1)


    EndCommandGroup("Asteroid Spawn")
end



Scene1()