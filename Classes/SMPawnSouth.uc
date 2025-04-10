class SMPawnSouth extends ROPawn;

// Copied from GOM 3, returns Southern Team Index
simulated event byte ScriptGetTeamNum()
{
    RETURN `ALLIES_TEAM_INDEX;
};

simulated event PreBeginPlay()
{
    PawnHandlerClass = class'SMPawnHandler';
    super(ROPawn).PreBeginPlay();
}

defaultproperties
{
    Begin Object Name=ROPawnSkeletalMeshComponent
		AnimSets(0)=AnimSet'CHR_Playeranim_Master.Anim.CHR_Stand_anim'
		AnimSets(1)=AnimSet'CHR_Playeranim_Master.Anim.CHR_ChestCover_anim'
		AnimSets(2)=AnimSet'CHR_Playeranim_Master.Anim.CHR_WaistCover_anim'
		AnimSets(3)=AnimSet'CHR_Playeranim_Master.Anim.CHR_StandCover_anim'
		AnimSets(4)=AnimSet'CHR_Playeranim_Master.Anim.CHR_Crouch_anim'
		AnimSets(5)=AnimSet'CHR_Playeranim_Master.Anim.CHR_Prone_anim'
		AnimSets(6)=AnimSet'CHR_Playeranim_Master.Anim.CHR_Hand_Poses_Master'
		AnimSets(7)=AnimSet'CHR_Playeranim_Master.Anim.CHR_Death_anim'
		AnimSets(8)=AnimSet'CHR_Playeranim_Master.Anim.CHR_Tripod_anim'
		AnimSets(9)=AnimSet'CHR_Playeranim_Master.Anim.Special_Actions'
		AnimSets(10)=AnimSet'CHR_Playeranim_Master.Anim.CHR_Melee'
		AnimSets(11)=AnimSet'CHR_Playeranim_Master.Anim.CHR_German_Unique'
		AnimSets(12)=none // Reserved for weapon specific animations
		AnimSets(13)=AnimSet'CHR_VN_Playeranim_Master.Anim.CHR_VN_Tripod_anim'
		AnimSets(14)=AnimSet'CHR_VN_Playeranim_Master.Anim.CHR_VN_Stand_anim'
		AnimSets(15)=AnimSet'CHR_VN_Playeranim_Master.Anim.CHR_VN_ChestCover_anim'
		AnimSets(16)=AnimSet'CHR_VN_Playeranim_Master.Anim.CHR_VN_WaistCover_anim'
		AnimSets(17)=AnimSet'CHR_VN_Playeranim_Master.Anim.CHR_VN_StandCover_anim'
		AnimSets(18)=AnimSet'CHR_VN_Playeranim_Master.Anim.CHR_VN_Crouch_anim'
		AnimSets(19)=AnimSet'CHR_VN_Playeranim_Master.Anim.CHR_VN_Prone_anim'
		AnimSets(20)=AnimSet'CHR_VN_Playeranim_Master.Anim.CHR_VN_Hand_Poses_Master'
		AnimSets(21)=AnimSet'CHR_VN_Playeranim_Master.Anim.VN_Special_Actions'
	End Object
}