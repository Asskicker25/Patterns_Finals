
scene1Time = 7 --7
scence2Time = 5 --5

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

function Scene2()

    BeginCommandGroup("CameraInit","Parallel")

        WaitForSeconds(scene1Time);
        BindGameObject("Falcon")
        MoveWithTime(4,-1,0,0)
        RotateWithTime(0,-80,-90,0)
        ScaleWithTime(0.002,0.002,0.002,0)

        BindGameObject("Camera")
        MoveWithTime(-20,0,5,0)

    EndCommandGroup("CameraInit")


    BeginCommandGroup("AsteroidSpawn2", "Parallel")

    WaitForSeconds(scene1Time);

        SpawnGameObject("Asteroid","Asteroid01" , 3);
        BindGameObject("Asteroid01")
        MoveWithTime(-20,0,4.6,0)
        RotateWithTime(70,90,0,0)

        WaitForSeconds(0.01)

        RotateWithTime(360,180,0,13)
        MoveWithSpeed(-20,0,-5,0.022)

    EndCommandGroup("AsteroidSpawn2")

    BeginCommandGroup("FalconInit", "Parallel")

    WaitForSeconds(scene1Time);
    
    BindGameObject("Falcon")
    RotateWithTime(90,180,-80,0)
    MoveWithTime(-20,0,3, 0)

    WaitForSeconds(0.1)
    FollowCurveWithTime(5).AddPoint(-20,0,3,  1,0,1)
    .AddPoint(-20,0,4.4,   1,0,-1)
    .AddPoint(-22,0,6,  -3,0,5)

    RotateWithTime(90,180,-90,2)
    WaitForSeconds(1.5)
    RotateWithTime(90,180,-180,1)
    WaitForSeconds(0.9)
    RotateWithTime(90,180,-270,1)

    EndCommandGroup("FalconInit")

    

    BindGameObject("Falcon")
    BeginCommandGroup("Fighter1","Parallel")

        WaitForSeconds(scene1Time);

        SpawnGameObject("Fighter","Fighter1");
        BindGameObject("Fighter1")
        MoveWithTime(-20,0,1, 0)
    
        FollowObject("Falcon", 5).SetFollowDistance(0.2).SetMaxSpeed(10).SetFollowOffset(0.4,0.2,-0.2)
        RotateWithTime(0,-30,0,5)

        SpawnGameObject("Fighter","Fighter2");
        BindGameObject("Fighter2")
        MoveWithTime(-20.2,0,0, 0)
        FollowObject("Falcon", 5).SetFollowDistance(0.8).SetMaxSpeed(10).SetFollowOffset(0.3,0.2,-0.5)
        RotateWithTime(0,-30,0,5)

        SpawnGameObject("Fighter","Fighter3");
        BindGameObject("Fighter3")
        MoveWithTime(-20.8,0,0, 0)
        FollowObject("Falcon", 5).SetFollowDistance(0.8).SetMaxSpeed(10).SetFollowOffset(0.8,0.2,-0.5)
        RotateWithTime(0,-30,0,5)

        SpawnGameObject("Fighter","Fighter4");
        BindGameObject("Fighter4")
        MoveWithTime(-20.8,0,0, 0)
        FollowObject("Falcon", 5).SetFollowDistance(0.8).SetMaxSpeed(10).SetFollowOffset(1.4,-0.2,-1.5)
        RotateWithTime(0,-30,0,5)


    EndCommandGroup("Fighter1")

   



    
end

function Scene3()

    BeginCommandGroup("CameraInit3", "Parallel")

    WaitForSeconds(scene1Time + scence2Time)

    BindGameObject("Falcon")
    MoveWithTime(-40,-1,0,0)
    RotateWithTime(0,-80,-90,0)
    ScaleWithTime(0.002,0.002,0.002,0)
    
    BindGameObject("Camera")
    MoveWithTime(-40,0,5,0)

    EndCommandGroup("CameraInit3")

end


Scene1()
Scene2()
Scene3()