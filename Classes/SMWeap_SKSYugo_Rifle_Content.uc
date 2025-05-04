//=============================================================================
// SMWeap_SKSYugo_Rifle_Content
//=============================================================================
// Content for Zastava M59/66A1 Rifle
//=============================================================================
// Original rights goes to Tripwire Interactive LLC
// Original code by Sturt "Psycho Ch1cken" Jeffery @ Antimatter Games, modified by me
//=============================================================================
class SMWeap_SKSYugo_Rifle_Content extends ROWeap_SKS_Rifle;

defaultproperties
{
    ArmsAnimSet=AnimSet'WP_VN_VC_SKS.Animation.WP_SKShands'

    // Weapon SkeletalMesh
    Begin Object Name=FirstPersonMesh
        SkeletalMesh=SkeletalMesh'SM_WP_SKS.Mesh.SM_SKSYugo_UPGD1'
        Materials(0)=MaterialInstanceConstant'WP_VN_VC_SKS.Materials.VC_SKS_lev1_M'
        PhysicsAsset=PhysicsAsset'WP_VN_VC_SKS.Phys.VC_SKS_UPGD1_Physics'
        AnimSets(0)=AnimSet'WP_VN_VC_SKS.Animation.WP_SKShands'
        AnimTreeTemplate=AnimTree'WP_VN_VC_SKS.Animation.WP_SKSHands_Tree'
        DepthPriorityGroup=SDPG_Foreground
        Scale=1.0
        FOV=70
    End Object

    // Pickup staticmesh
    Begin Object Name=PickupMesh
        SkeletalMesh=SkeletalMesh'SM_WP_SKS.Mesh.SM_SKSYugo_3rd_Master'
        PhysicsAsset=PhysicsAsset'WP_VN_3rd_Master.Phy.SKS_3rd_Master_Physics'
        AnimTreeTemplate=AnimTree'WP_VN_3rd_Master.AnimTree.SKS_Rifle_3rd_Tree'
        CollideActors=true
        BlockActors=true
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

    AttachmentClass=class'Separatism.SMWeapAttach_SKSYugo_Rifle'
}