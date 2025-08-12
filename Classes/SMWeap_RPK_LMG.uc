//=============================================================================
// SMWeap_RPK_LMG
//=============================================================================
// Russian RPK Light Machine Gun
//=============================================================================
// Original rights goes to Tripwire Interactive LLC
// Original code by Sturt "Psycho Ch1cken" Jeffery @ Antimatter Games, modified by me
//=============================================================================
class SMWeap_RPK_LMG extends ROWeap_L2A1_LMG
    abstract;

defaultproperties
{
    WeaponContentClass(0)="Separatism.SMWeap_RPK_LMG_Content"

    RoleSelectionImage(0)=Texture2D'VN_UI_Textures.WeaponTex.VN_Weap_RPD_LMG_Drum'

    // MAIN FIREMODE
    WeaponProjectiles(0)=class'AKMBullet'
    bLoopHighROFSounds(0)=true
    FireInterval(0)=+0.1 // 600 RPM

    // ALT FIREMODE
    WeaponProjectiles(ALTERNATE_FIREMODE)=class'AKMBullet'
    FireInterval(ALTERNATE_FIREMODE)=+0.00138 // ~ MOA

    // Recoil
    maxRecoilPitch=290
    minRecoilPitch=290
    maxRecoilYaw=135
    minRecoilYaw=-97
    minRecoilYawAbsolute=30
    maxDeployedRecoilPitch=40
    minDeployedRecoilPitch=40
    maxDeployedRecoilYaw=40
    minDeployedRecoilYaw=40
    minDeployedRecoilYawAbsolute=40
    RecoilRate=0.07
    RecoilMaxYawLimit=1500
    RecoilMinYawLimit=64035
    RecoilMaxPitchLimit=1500
    RecoilMinPitchLimit=64785
    RecoilISMaxYawLimit=500
    RecoilISMinYawLimit=65035
    RecoilISMaxPitchLimit=350
    RecoilISMinPitchLimit=65035
    RecoilBlendOutRatio=0.35f
    RecoilViewRotationScale=0.45

    InstantHitDamage(0)=93
    InstantHitDamage(1)=93

    InstantHitDamageTypes(0)=class'RODmgType_AKMBullet'
    InstantHitDamageTypes(1)=class'RODmgType_AKMBullet'

    // Ammo
    AmmoClass=class'SMAmmo_762x39_RPKMag'
    MaxAmmoCount=41
    bUsesMagazines=true
    InitialNumPrimaryMags=4
    NumMagsToResupply=2
    MaxNumPrimaryMags=4
    bPlusOneLoading=true
    bCanReloadNonEmptyMag=true;
    PenetrationDepth=15
    MaxPenetrationTests=3
    MaxNumPenetrations=2
}