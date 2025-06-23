//=============================================================================
// SMWeap_AKM70_AssaultRifle_M70AB1
//=============================================================================
// Level 2 Zastava M70 Assault Rifle - M70AB1 with folding stock
//=============================================================================
// Original rights goes to Tripwire Interactive LLC
// Original code by Sturt "Psycho Ch1cken" Jeffery @ Antimatter Games, modified by me
//=============================================================================
class SMWeap_AKM70_AssaultRifle_M70AB1 extends ROWeap_AK47_AssaultRifle_Type56_1;

defaultproperties
{
    AttachmentClass=class'Separatism.SMWeapAttach_AKM70_AssaultRifle_M70AB1'

    // Replace variables with similar values as AKM
    ArmsAnimSet=AnimSet'WP_VN_VC_AK47.Animation.WP_AK47hands_UPGD2'

    // MAIN FIREMODE
    WeaponProjectiles(0)=class'AKMBullet'
    bLoopHighROFSounds(0)=true
    FireInterval(0)=+0.1 // 600 RPM

    // ALT FIREMODE
    WeaponProjectiles(ALTERNATE_FIREMODE)=class'AKMBullet'
    FireInterval(ALTERNATE_FIREMODE)=+0.1

    // Slightly less accurate - stamped receiver
    Spread(0)=0.00138 // ~5 MOA

    // Recoil
    maxRecoilPitch=240
    minRecoilPitch=240
    maxRecoilYaw=135
    minRecoilYaw=97
    RecoilRate=0.09

    InstantHitDamage(0)=93
    InstantHitDamage(1)=93

    InstantHitDamageTypes(0)=class'RODmgType_AKMBullet'
    InstantHitDamageTypes(1)=class'RODmgType_AKMBullet'

    AmmoClass=class'ROAmmo_762x39_AKMMag'

    Begin Object Name=FirstPersonMesh
        SkeletalMesh=SkeletalMesh'SM_WP_AK47.Mesh.SM_AKM70_UPGD2'
        AnimSets(0)=AnimSet'WP_VN_VC_AK47.Animation.WP_AK47hands_UPGD2'
        AnimTreeTemplate=AnimTree'WP_VN_VC_AK47.Animation.VC_AK47_UPGD2_Tree'
    End Object

    Begin Object Name=PickupMesh
        SkeletalMesh=SkeletalMesh'SM_WP_AK47.Mesh.SM_AKM70_3rd_Master_UPGD2'
        AnimTreeTemplate=AnimTree'WP_VN_3rd_Master.AnimTree.Type56_1_AssaultRifle_3rd_Tree'
    End Object

    // Audio
    WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_AK47.Play_WEP_AK47_Fire_Loop_3P', FirstPersonCue=AkEvent'WW_WEP_AK47.Play_WEP_AK47_Fire_Stereo_Loop')
    WeaponFireSnd(ALTERNATE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_AK47.Play_WEP_AK47_Fire_Single_3P', FirstPersonCue=AkEvent'WW_WEP_AK47.Play_WEP_AK47_Fire_Single')

    // Advanced (High RPM) Fire Effects
    bLoopingFireSnd(DEFAULT_FIREMODE)=true
    WeaponFireLoopEndSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_AK47.Play_WEP_AK47_Tail_3P', FirstPersonCue=AkEvent'WW_WEP_AK47.Play_WEP_AK47_Stereo_Tail')
}