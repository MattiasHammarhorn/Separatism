//=============================================================================
// SMWeapAttach_M76Scoped_Rifle
//=============================================================================
// 3rd person Weapon attachment for the Zastava M76 scoped rifle.
//=============================================================================
// Original rights goes to Tripwire Interactive LLC
// Original code by Nate Steger @ Antimatter Games, modified by me
//=============================================================================
class SMWeapAttach_M76Scoped_Rifle extends ROWeapAttach_SVDScoped_Rifle;

defaultproperties
{
	WeaponClass=class'SMWeap_M76Scoped_Rifle'

	// Weapon SkeletalMesh
	Begin Object Name=SkeletalMeshComponent0
		SkeletalMesh=SkeletalMesh'SM_WP_M76.Mesh.SM_M76_sniper_3rd_Master'
		AnimSets(0)=AnimSet'WP_VN_3rd_Master.Anim.SVD_3rd_Anims'
		AnimTreeTemplate=AnimTree'WP_VN_3rd_Master.AnimTree.SVD_ScopedRifle_3rd_Tree'
		Animations=NONE
		PhysicsAsset=PhysicsAsset'WP_VN_3rd_Master.Phy_Bounds.SVD_sniper_3rd_Bounds_Physics'
	End Object
}