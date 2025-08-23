//=============================================================================
// SMWeapAttach_TTYugo_Pistol
//=============================================================================
// 3rd person Weapon attachment class for the Zastava M57 Pistol
//=============================================================================
// Original rights goes to Tripwire Interactive LLC
// Original code by Sturt "Psycho Ch1cken" Jeffery @ Antimatter Games, modified by me
//=============================================================================
class SMWeapAttach_TTYugo_Pistol extends ROWeapAttach_TT33_Pistol;

defaultproperties
{
    Begin Object Name=SkeletalMeshComponent0
        SkeletalMesh=SkeletalMesh'SM_WP_Tokarev_TT33.Mesh.SM_TTYugo_3rd_Master'
        AnimSets(0)=AnimSet'WP_VN_3rd_Master.Anim.TT33_3rd_anim'
        PhysicsAsset=none
        CullDistance=5000
    End Object

    WeaponClass=class'SMWeap_TTYugo_Pistol'
}