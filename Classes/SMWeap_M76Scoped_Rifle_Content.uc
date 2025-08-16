//=============================================================================
// SMWeap_M76Scoped_Rifle_Content
//=============================================================================
// Content for the Zastava M76 scoped rifle.
//=============================================================================
// Original rights goes to Tripwire Interactive LLC
// Original code by Nate Steger @ Antimatter Games, modified by me
//=============================================================================
class SMWeap_M76Scoped_Rifle_Content extends SMWeap_M76Scoped_Rifle;

defaultproperties
{
	ArmsAnimSet=AnimSet'WP_VN_VC_SVD.Animation.WP_SVDhands'

    // Weapon SkeletalMesh
    Begin Object Name=FirstPersonMesh
        DepthPriorityGroup=SDPG_Foreground
        SkeletalMesh=SkeletalMesh'SM_WP_M76.Mesh.SM_M76_Sniper_UPGD1'
        PhysicsAsset=PhysicsAsset'WP_VN_VC_SVD.Phys.VC_SVD_Sniper_UPGD1_Physics'
        AnimSets(0)=AnimSet'WP_VN_VC_SVD.Animation.WP_SVDhands'
        AnimTreeTemplate=AnimTree'WP_VN_VC_SVD.Animation.VC_SVD_Tree'
        Scale=1.0
        FOV=70
    End Object

    // Pickup staticmesh
	Begin Object Name=PickupMesh
		SkeletalMesh=SkeletalMesh'SM_WP_M76.Mesh.SM_M76_sniper_3rd_Master'
		PhysicsAsset=PhysicsAsset'WP_VN_3rd_Master.Phy.SVD_3rd_Master_Physics'
		AnimTreeTemplate=AnimTree'WP_VN_3rd_Master.AnimTree.SVD_ScopedRifle_3rd_Tree'
		CollideActors=true
		BlockActors=true
		BlockZeroExtent=true
		BlockNonZeroExtent=true//false
		BlockRigidBody=true
		bHasPhysicsAssetInstance=false
		bUpdateKinematicBonesFromAnimation=false
		PhysicsWeight=1.0
		RBChannel=RBCC_GameplayPhysics
		RBCollideWithChannels=(Default=TRUE,GameplayPhysics=TRUE,EffectPhysics=TRUE)
		bSkipAllUpdateWhenPhysicsAsleep=TRUE
		bSyncActorLocationToRootRigidBody=true
	End Object

    AttachmentClass=class'Separatism.SMWeapAttach_M76Scoped_Rifle'

	ScopeLenseMICTemplate=MaterialInstanceConstant'WP_VN_VC_SVD.Materials.VC_SVD_LenseMat'
}