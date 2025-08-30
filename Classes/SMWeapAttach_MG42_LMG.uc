//=============================================================================
// SMWeapAttach_MG42_LMG
//=============================================================================
// 3rd person Weapon attachment class for the MG42 LMG
//=============================================================================
// Original rights goes to Tripwire Interactive LLC
// Original code by Sturt Martin Cooke @ Antimatter Games, modified by me
//=============================================================================
class SMWeapAttach_MG42_LMG extends ROWeaponAttachmentBipod;

defaultproperties
{
    TriggerHoldDuration=0.2

    CarrySocketName=WeaponSling
    ThirdPersonHandsAnim=MG42_Handpose
    IKProfileName=MG34

    // Weapon SkeletalMesh
    Begin Object Name=SkeletalMeshComponent0
        SkeletalMesh=SkeletalMesh'SM_WP_MG42_LMG.Mesh.MG42_3rd_Master'
        AnimTreeTemplate=AnimTree'SM_WP_MG42_LMG.Anims.MG42_3rd_Tree'
        AnimSets(0)=AnimSet'SM_WP_MG42_LMG.Anims.MG42_3rd_anim'
        PhysicsAsset=none
        CullDistance=5000
    End Object
    
    MuzzleFlashSocket=MuzzleFlashSocket
    MuzzleFlashPSCTemplate=ParticleSystem'FX_VN_Weapons.MuzzleFlashes.FX_VN_MuzzleFlash_3rdP_Rifles_round'
    MuzzleFlashDuration=0.33
    MuzzleFlashLightClass=class'ROGame.RORifleMuzzleFlashLight'
    WeaponClass=class'SMWeap_MG42_LMG'

    // Shell eject FX
    ShellEjectSocket=ShellEjectSocket
    ShellEjectPSCTemplate=ParticleSystem'FX_VN_Weapons_Two.ShellEjects.FX_Wep_ShellEject_M1919'

    // Tracer FX
    TracerClass=class'M1919BulletTracer'
    TracerFrequency=10

    //ROPawn weapon specific animations
	CHR_AnimSet=AnimSet'CHR_VN_ARVN_Playeranim_Master.Weapons.CHR_M1919LMG'

    // Firing animations
    FireAnim=Shoot
    FireLastAnim=Shoot_Last
    IdleAnim=Idle
    IdleEmptyAnim=Idle_Empty

    WP_Prone_ReloadAnims(0)=Prone_Deploy_Reload_Empty
    WP_Prone_ReloadAnims(1)=Prone_Deploy_Reload_Half

    Prone_ReloadAnims(0)=Prone_Deploy_Reload_Empty
    Prone_ReloadAnims(1)=Prone_Deploy_Reload_Half

    ReloadAnims(0)=Reload_Empty
    ReloadAnims(1)=Reload_Half
}