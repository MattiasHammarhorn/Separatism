//=============================================================================
// SMWeapAttach_AKM70_AssaultRifle_M70B1
//=============================================================================
// 3rd person Weapon attachment class for the Zastava M70B1 Assault Rifle (Yugo AKM)
//=============================================================================
// Original rights goes to Tripwire Interactive LLC
// Original code by Sturt "Psycho Ch1cken" Jeffery @ Antimatter Games, modified by me
//=============================================================================
class SMWeapAttach_AKM70_AssaultRifle_M70B1 extends ROWeapAttach_AK47_AssaultRifle_AKM;

defaultproperties
{
    WeaponClass=class'SMWeap_AKM70_AssaultRifle_M70B1'

	// Weapon SkeletalMesh
    Begin Object Name=SkeletalMeshComponent0
        SkeletalMesh=SkeletalMesh'SM_WP_AK47.Mesh.SM_AKM70_3rd_Master'
        AnimSets(0)=AnimSet'WP_VN_3rd_Master.Anim.AK47_3rd_anim'
        AnimTreeTemplate=AnimTree'WP_VN_3rd_Master.AnimTree.AKM_AssaultRifle_3rd_Tree'
        Animations=NONE
    End Object
}