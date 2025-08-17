//=============================================================================
// SMWeap_M76Scoped_Rifle
//=============================================================================
// The Zastava M76 scoped rifle.
//=============================================================================
// Original rights goes to Tripwire Interactive LLC
// Original code by Nate Steger @ Antimatter Games, modified by me
//=============================================================================

class SMWeap_M76Scoped_Rifle extends ROWeap_SVDScoped_Rifle
    abstract;

defaultproperties
{
    WeaponContentClass(0)="Separatism.SMWeap_M76Scoped_Rifle_Content"

    RoleSelectionImage(0)=Texture2D'VN_UI_Textures.WeaponTex.VN_Weap_SVD_SniperRifle'

    WeaponProjectiles(0)=class'M76ScopedBullet'

    InstantHitDamage(0)=115
    InstantHitDamage(1)=115

    InstantHitDamageTypes(0)=class'SMDmgType_M76ScopedBullet'
    InstantHitDamageTypes(1)=class'SMDmgType_M76ScopedBullet'
    
    // Ammo
    AmmoClass=class'SMAmmo_792x57_M76Mag'
}