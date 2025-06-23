//=============================================================================
// SMWeapAttach_AKM70_AssaultRifle_M70AB1
//=============================================================================
// 3rd person Weapon attachment class for the Zastava M70AB1 (Yugo AKM) Assault Rifle
// Has foldable stock
//=============================================================================
// Original rights goes to Tripwire Interactive LLC
// Original code by Sturt "Psycho Ch1cken" Jeffery @ Antimatter Games, modified by me
//=============================================================================
class SMWeapAttach_AKM70_AssaultRifle_M70AB1 extends ROWeapAttach_AK47_AssaultRifle_Type56_1;

defaultproperties
{
    WeaponClass=class'SMWeap_AKM70_AssaultRifle_M70AB1'

	// Weapon SkeletalMesh
    Begin Object Name=SkeletalMeshComponent0
        SkeletalMesh=SkeletalMesh'SM_WP_AK47.Mesh.SM_AKM70_3rd_Master_UPGD2'
        AnimSets(0)=AnimSet'WP_VN_3rd_Master.Anim.Type56_UPGD2_3rd_anim'
        AnimTreeTemplate=AnimTree'WP_VN_3rd_Master.AnimTree.Type56_1_AssaultRifle_3rd_Tree'
        Animations=NONE
    End Object
}