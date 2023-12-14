
BeginCommandGroup("CameraInit","Parallel")

    BindGameObject("Camera")
    MoveWithTime(0,0,3,0)

    WaitForSeconds(0.01)


    FollowObject("Falcon",10).SetSimpleFollow(1).SetMaxSpeed(20).SetFollowAxis(1,0,0)

    BindGameObject("Falcon")
    MoveWithTime(-3,0,0,3)

    WaitForSeconds(3);

    MoveWithTime(-3,0,1.5,3)

EndCommandGroup("CameraInit")


BeginCommandGroup("Asteroid Spawn", "Parallel")

    SpawnGameObject("Asteroid","Asteroid1" , 0);

    WaitForSeconds(0.1)
    BindGameObject("Asteroid1")
    MoveWithTime(0,0,0,0)

EndCommandGroup("Asteroid Spawn")