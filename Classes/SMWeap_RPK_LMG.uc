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

    // Ammo
    AmmoClass=class'SMAmmo_762x39_RPKMag'
    MaxAmmoCount=41
}