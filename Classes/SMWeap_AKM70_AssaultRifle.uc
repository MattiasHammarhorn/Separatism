//=============================================================================
// SMWeap_AKM70_AssaultRifle
//=============================================================================
// Yugoslav derivatives of the AKM Assault Rifle. Zastava M70B1 and M70AB1
//=============================================================================
// Original rights to Tripwire Interactive LLC
// Original code by Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games, modified by me
//=============================================================================
class SMWeap_AKM70_AssaultRifle extends ROWeap_AK47_AssaultRifle
    abstract;

defaultproperties
{
    WeaponContentClass.Empty
    WeaponContentClass(0)="Separatism.SMWeap_AKM70_AssaultRifle_M70B1"
    WeaponContentClass(1)="Separatism.SMWeap_AKM70_AssaultRifle_M70AB1"
    
    RoleSelectionImage.Empty
    RoleSelectionImage(0)=Texture2D'VN_UI_Textures.WeaponTex.VN_Weap_AKM_Rifle'
    RoleSelectionImage(1)=Texture2D'VN_UI_Textures.WeaponTex.VN_Weap_Type56-1_Rifle'
}