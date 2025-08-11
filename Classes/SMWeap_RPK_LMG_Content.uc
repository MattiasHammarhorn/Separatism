class SMWeap_RPK_LMG_Content extends SMWeap_RPK_LMG;

defaultproperties
{
    // Arms
    ArmsAnimSet=AnimSet'WP_VN_AUS_L2A1.Animation.WP_L2A1hands'

    // Weapon SkeletalMesh
    Begin Object Name=FirstPersonMesh
        DepthPriorityGroup=SDPG_Foreground
        SkeletalMesh=SkeletalMesh'SM_WP_RPK.Mesh.SM_RPK_UPGD1'
        PhysicsAsset=PhysicsAsset'WP_VN_AUS_L2A1.Phys.AUS_L2A1_UPGD1_Physics'
        AnimSets(0)=AnimSet'WP_VN_AUS_L2A1.Animation.WP_L2A1hands'
        AnimTreeTemplate=AnimTree'WP_VN_AUS_L2A1.Animation.WP_L2A1hands_Tree'
        Scale=1.0
        FOV=70
    End object

    // Pickup staticmesh
    Begin Object Name=PickupMesh
        SkeletalMesh=SkeletalMesh'SM_WP_RPK.Mesh.SM_RPK_3rd_Master_UPGD1'
        PhysicsAsset=PhysicsAsset'WP_VN_AUS_3rd_Master.Phy.L2A1_3rd_Physics'
        AnimTreeTemplate=AnimTree'WP_VN_AUS_3rd_Master.AnimTree.L2A1_3rd_Tree'
        CollideActors=true
        BlockZeroExtent=true
        BlockNonZeroExtent=true
        BlockRigidBody=true
        bHasPhysicsAssetInstance=false
        bUpdateKinematicBonesFromAnimation=false
        PhysicsWeight=1.0
        RBChannel=RBCC_GameplayPhysics
        RBCollideWithChannels=(Default=TRUE,GameplayPhysics=TRUE,EffectPhysics=TRUE)
        bSkipAllUpdateWhenPhysicsAsleep=TRUE
        bSyncActorLocationToRootRigidBody=true
    End Object

    WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_AK47.Play_WEP_AK47_Fire_Loop_3P', FirstPersonCue=AkEvent'WW_WEP_AK47.Play_WEP_AK47_Fire_Stereo_Loop')
	WeaponFireSnd(ALTERNATE_FIREMODE)=(DefaultCue= AkEvent'WW_WEP_AK47.Play_WEP_AK47_Fire_Single_3P', FirstPersonCue=AkEvent'WW_WEP_AK47.Play_WEP_AK47_Fire_Single')

    bLoopingFireSnd(DEFAULT_FIREMODE)=true
	WeaponFireLoopEndSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_AK47.Play_WEP_AK47_Tail_3P', FirstPersonCue=AkEvent'WW_WEP_AK47.Play_WEP_AK47_Stereo_Tail')
	bLoopHighROFSounds(DEFAULT_FIREMODE)=true
}