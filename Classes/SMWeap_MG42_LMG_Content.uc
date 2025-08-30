//=============================================================================
// SMWeap_MG42_LMG
//=============================================================================
// MG42 light machine gun
//=============================================================================
// Original rights goes to Tripwire Interactive LLC
// Original code by Martin Cooke @ Antimatter Games, modified by me
//=============================================================================
class SMWeap_MG42_LMG_Content extends SMWeap_MG42_LMG;

defaultproperties
{
    // Arms
    ArmsAnimSet=AnimSet'SM_WP_MG42_LMG.Anims.WP_MG42bipodhands'

    // Weapon SkeletalMesh
    Begin Object Name=FirstPersonMesh
        DepthPriorityGroup=SDPG_Foreground
        SkeletalMesh=SkeletalMesh'SM_WP_MG42_LMG.Mesh.Ger_MG42'
        PhysicsAsset=none//PhysicsAsset'WP_VN_VC_MG34_LMG.Phy.VC_MG34_LMG_Physics'
        AnimSets(0)=AnimSet'SM_WP_MG42_LMG.Anims.WP_MG42bipodhands'
        AnimTreeTemplate=AnimTree'SM_WP_MG42_LMG.Anims.Ger_MG42Bipod_Tree'
        Scale=1.0
        FOV=70
    End Object

    // Pickup staticmesh
    Begin Object Name=PickupMesh
        SkeletalMesh=SkeletalMesh'SM_WP_MG42_LMG.Mesh.MG42_3rd_Master'
        PhysicsAsset=PhysicsAsset'WP_VN_3rd_Master_04.Phy.MG34_3rd_Physics'
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

    AttachmentClass=class'Separatism.SMWeapAttach_MG42_LMG'

    WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_PPSH.Play_WEP_PPSH_Loop_3P', FirstPersonCue=AkEvent'WW_WEP_PPSH.Play_WEP_PPSH_Loop')
    WeaponFireSnd(ALTERNATE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_PPSH.Play_WEP_PPSH_Single_3P', FirstPersonCue=AkEvent'WW_WEP_PPSH.Play_WEP_PPSH_Single')

    bLoopingFireSnd(DEFAULT_FIREMODE)=true
    WeaponFireLoopEndSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_PPSH.Play_WEP_PPSH_Tail_3P', FirstPersonCue=AkEvent'WW_WEP_PPSH.Play_WEP_PPSH_Tail')
    // bLoopHighROFSounds(DEFAULT_FIREMODE)=true
}