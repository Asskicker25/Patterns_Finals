
BeginCommandGroup("CameraInit","Parallel")

    BindGameObject("Camera")
    MoveWithTime(0,0,3,0)

    WaitForSeconds(0.01)

    FollowObject("Falcon",3).SetSimpleFollow(1).SetMaxSpeed(20)

    BindGameObject("Falcon")
    MoveWithTime(-3,0,0,3)

EndCommandGroup("CameraInit")