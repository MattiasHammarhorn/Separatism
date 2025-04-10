class SMCharCustMannequin extends ROCharCustMannequin
    notplaceable;

event PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    PawnHandlerClass = class'SMPawnHandler';
}

// This doesn't do anything either!?
function UpdateMannequin(byte TeamIndex, byte ArmyIndex, bool bPilot, int ClassIndex, byte HonorLevel, byte TunicID, byte TunicMaterialID, byte ShirtID, byte HeadID, byte HairID, byte HeadgearID, byte HeadgearMatID, byte FaceItemID, byte FacialHairID, byte TattooID, optional bool bMainMenu)
{
    local Texture2D ShirtD, ShirtN, ShirtS, TattooTex;
    local byte bAltFieldgear, byteDisposal;
    local float HonourPct;
    local byte bNoHeadgear, bNoFacialHair;
    local ROMapInfo ROMI;
    local float TattooUOffset, TattooVOffset, TattooDrawScale;
    local rotator InitialRot;
    if( ArmyIndex == 255 )
        return;
    
    InitialRot = mesh.Rotation;

    DisplayedCharConfig.TunicMesh = TunicID;
    DisplayedCharConfig.TunicMaterial = TunicMaterialID;
    DisplayedCharConfig.ShirtTexture = ShirtID;
    DisplayedCharConfig.HeadMesh = HeadID;
    DisplayedCharConfig.HairMaterial = HairID;
    DisplayedCharConfig.HeadgearMesh = HeadgearID;
    DisplayedCharConfig.HeadgearMat = HeadgearMatID;
    DisplayedCharConfig.FaceItemMesh = FaceItemID;
    DisplayedCharConfig.FacialHairMesh = FacialHairID;
    DisplayedCharConfig.TattooTex = TattooID;

    if( HeadAndArmsMIC == none )
        HeadAndArmsMIC = new class'MaterialInstanceConstant';
    
    if( BodyMIC == none )
        BodyMIC = new class'MaterialInstanceConstant';

    if( HeadgearMIC == none )
        HeadgearMIC = new class'MaterialInstanceConstant';

    if( HairMIC == none )
        HairMIC = new class'MaterialInstanceConstant';

    if( ThirdPersonHeadgearMeshComponent.AttachedToSkelComponent != none )
        Mesh.DetachComponent(ThirdPersonHeadgearMeshComponent);
    if( FaceItemMeshComponent.AttachedToSkelComponent != none )
        Mesh.DetachComponent(FaceItemMeshComponent);
    if( FacialHairMeshComponent.AttachedToSkelComponent != none )
        Mesh.DetachComponent(FacialHairMeshComponent);
    if( ThirdPersonHeadAndArmsMeshComponent.AttachedToSkelComponent != none )
        Mesh.DetachComponent(ThirdPersonHeadAndArmsMeshComponent);
    if( WeaponMeshComponent.AttachedToSkelComponent != none )
        Mesh.DetachComponent(WeaponMeshComponent);
    
    if( ClassIndex < 0 || bMainMenu )
        ClassIndex = bPilot ? `ROCI_CombatPilot : `ROCI_Scout;
    bAltFieldgear = (TeamIndex == `AXIS_TEAM_INDEX) ? TunicMaterialID : 0;
    bIsPilot = bPilot;

    TunicMesh = class'SMPawnHandler'.static.GetTunicMeshes(TeamIndex, ArmyIndex, byte(bPilot), TunicID, bNoHeadgear);
    BodyMICTemplate = class'SMPawnHandler'.static.GetBodyMIC(TeamIndex, ArmyIndex, byte(bPilot), TunicID, TunicMaterialID);
    FieldgearMesh = class'SMPawnHandler'.static.GetFieldgearMesh(TeamIndex, ArmyIndex, TunicID, ClassIndex, bAltFieldgear);
    HeadAndArmsMesh = class'SMPawnHandler'.static.GetHeadAndArmsMesh(TeamIndex, ArmyIndex, byte(bPilot), HeadID, byteDisposal);
    HeadAndArmsMICTemplate = class'SMPawnHandler'.static.GetHeadMIC(TeamIndex, ArmyIndex, HeadID, TunicID, byte(bPilot));
    HeadgearMesh = class'SMPawnHandler'.static.GetHeadgearMesh(TeamIndex, ArmyIndex, byte(bPilot), HeadID, HairID, HeadgearID, HeadgearMatID, HeadgearMICTemplate, HairMICTemplate, HeadgearAttachSocket, byteDisposal);
    FaceItemMesh = class'SMPawnHandler'.static.GetFaceItemMesh(TeamIndex, ArmyIndex, byte(bPilot), HeadgearID, FaceItemID, FaceItemAttachSocket, bNoFacialHair);
    FacialHairMesh = class'SMPawnHandler'.static.GetFacialHairMesh(TeamIndex, ArmyIndex, FacialHairID, FacialHairAttachSocket);

    BodyMIC.SetParent(BodyMICTemplate);
    HeadAndArmsMIC.SetParent(HeadAndArmsMICTemplate);
    HeadgearMIC.SetParent(HeadgearMICTemplate);
    HairMIC.SetParent(HairMICTemplate);

    if(HeadAndArmsMIC != none)
    {
        HeadAndArmsMIC.ClearParameterValues();

        if( class'SMPawnHandler'.static.GetShirtTextures(TeamIndex, ArmyIndex, byte(bPilot), TunicID, ShirtID, ShirtD, ShirtN, ShirtS) )
        {
            HeadAndArmsMIC.SetTextureParameterValue(PawnHandlerClass.default.ShirtDiffuseParam,ShirtD);
            HeadAndArmsMIC.SetTextureParameterValue(PawnHandlerClass.default.ShirtNormalParam,ShirtN);
            HeadAndArmsMIC.SetTextureParameterValue(PawnHandlerClass.default.ShirtSpecParam,ShirtS);
        }

        TattooTex = class'SMPawnHandler'.static.GetTattooTexture(TeamIndex, ArmyIndex, byte(bPilot), TattooID, TattooUOffset, TattooVOffset, TattooDrawScale);

        if( TattooID > 0 && TattooTex != none )
        {
            HeadAndArmsMIC.SetTextureParameterValue(PawnHandlerClass.default.TattooParam, TattooTex);
            HeadAndArmsMIC.SetScalarParameterValue(PawnHandlerClass.default.TattooUOffsetParam,TattooUOffset);
            HeadAndArmsMIC.SetScalarParameterValue(PawnHandlerClass.default.TattooVOffsetParam,TattooVOffset);
            HeadAndArmsMIC.SetScalarParameterValue(PawnHandlerClass.default.TattooDrawScaleParam,TattooDrawScale);
        }
    }

    ROMI = ROMapInfo(WorldInfo.GetMapInfo());

    if(ROMI != none)
    {
        CompositedBodyMesh = ROMI.GetCachedCompositedPawnMesh(TunicMesh, FieldgearMesh);
    }
    else
    {
        `log("*** WARNING! - "$self$" - ROMI = NONE! Couldn't set composite mesh for customization mannequin.");
        return;
    }

    CompositedBodyMesh.Characterization = PlayerHIKCharacterization;

    Mesh.ReplaceSkeletalMesh(CompositedBodyMesh);

    Mesh.SetMaterial(0, BodyMIC);

    Mesh.GenerateAnimationOverrideBones(HeadAndArmsMesh);

    ThirdPersonHeadAndArmsMeshComponent.SetSkeletalMesh(HeadAndArmsMesh);
    ThirdPersonHeadAndArmsMeshComponent.SetMaterial(0, HeadAndArmsMIC);
    ThirdPersonHeadAndArmsMeshComponent.SetParentAnimComponent(Mesh);
    ThirdPersonHeadAndArmsMeshComponent.SetShadowParent(Mesh);
    ThirdPersonHeadAndArmsMeshComponent.SetLODParent(Mesh);
    AttachComponent(ThirdPersonHeadAndArmsMeshComponent);
    
    // Skip mud and grime for now
    HonourPct = FClamp(HonorLevel / 100, 0.0, 1.0);

    if( bPilot )
        HonourPct *= 0.5;
    
    BodyMIC.SetScalarParameterValue(PawnHandlerClass.default.TunicGrimeParam, HonourPct);
    BodyMIC.SetScalarParameterValue(PawnHandlerClass.default.TunicMudParam, HonourPct * 5.0);
    HeadAndArmsMIC.SetScalarParameterValue(PawnHandlerClass.default.HeadGrimeParam, HonourPct);
    HeadAndArmsMIC.SetScalarParameterValue(PawnHandlerClass.default.HeadMudParam, HonourPct * 5.0);

    if( HeadgearMesh != none && bNoHeadgear == 0 )
    {
        AttachNewHeadgear(HeadgearMesh);
    }

    if( FaceItemID > 0 && FaceItemMesh != none )
    {
        AttachNewFaceItem(FaceItemMesh);
    }

    if( FacialHairID > 0 && FacialHairMesh != none && bNoFacialHair == 0 )
    {
        AttachNewFacialHair(FacialHairMesh);
    }

    AttachPreviewWeapon(TeamIndex, ArmyIndex);

    mesh.SetRotation(InitialRot);
}