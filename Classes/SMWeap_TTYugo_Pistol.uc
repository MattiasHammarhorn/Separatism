//=============================================================================
// SMWeap_TTYugo_Pistol
//=============================================================================
// Zastava M57, Yugoslav derivate of Tokarev TT33 Pistol
//=============================================================================
// Original rights goes to Tripwire Interactive LLC
// Original code by Sturt "Psycho Ch1cken" Jeffery @ Antimatter Games, modified by me
//=============================================================================
class SMWeap_TTYugo_Pistol extends ROWeap_TT33_Pistol
    abstract;

defaultproperties
{
    WeaponContentClass(0)="Separatism.SMWeap_TTYugo_Pistol_Content"
    
    WeaponProjectiles(0)=class'TT33Bullet'

    MaxAmmoCount=10
    AmmoClass=class'SMAmmo_762x25_TTYugoMag'
}