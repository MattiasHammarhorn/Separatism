//=============================================================================
// SMWeap_TTYugo_Pistol_Content
//=============================================================================
// Content for Zastava M57 Pistol
//=============================================================================
// Original rights goes to Tripwire Interactive LLC
// Original code by Sturt "Psycho Ch1cken" Jeffery @ Antimatter Games, modified by me
//=============================================================================
class SMWeap_TTYugo_Pistol_Content extends SMWeap_TTYugo_Pistol;

defaultproperties
{
    //Arms
    ArmsAnimSet=AnimSet'WP_VN_VC_Tokarev_TT33.Animation.WP_TT33Hands'

    // Weapon SkeletalMesh
    Begin Object Name=FirstPersonMesh
        DepthPriorityGroup=SDPG_Foreground
        SkeletalMesh=SkeletalMesh'SM_WP_Tokarev_TT33.Mesh.SM_TT_Yugo'
        PhysicsAsset=none
        AnimSets(0)=AnimSet'WP_VN_VC_Tokarev_TT33.Animation.WP_TT33Hands'
        AnimTreeTemplate=AnimTree'WP_VN_VC_Tokarev_TT33.Animation.Sov_TT33_Tree'
        Scale=1.0
        FOV=70
    End Object

    // Pickup staticmesh
    Begin Object Name=PickupMesh
        SkeletalMesh=SkeletalMesh'WP_VN_3rd_Master.Mesh.TT33_3rd_master'
        PhysicsAsset=PhysicsAsset'WP_VN_3rd_Master.Phy.TT33_3rd_Master_Physics'
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

    AttachmentClass=class'Separatism.SMWeapAttach_TTYugo_Pistol'
}