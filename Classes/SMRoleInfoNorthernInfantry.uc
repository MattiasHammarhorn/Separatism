class SMRoleInfoNorthernInfantry extends RORoleInfo
    abstract;

defaultproperties
{
    Items[RORIGM_Default]={(
                    // SECONDARY : DEFAULTS
                    SecondaryWeapons=(class'Separatism.SMWeap_TTYugo_Pistol'),
                    // Squad Leader Items
                    SquadLeaderItems=(class'ROGame.ROItem_Binoculars')
        )}

    bAllowPistolsInRealism=true

    RoleRootClass=class'RORoleInfoNorthernInfantry'
}