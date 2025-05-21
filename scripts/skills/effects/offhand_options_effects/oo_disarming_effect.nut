this.oo_disarming_effect <- this.inherit("scripts/skills/skill", {
	m = {
		Echoed = false
		},

	function create()
	{
		this.m.ID = "effects.oo_disarming_effect";
		this.m.Name = "Disarming Sidearm";
		this.m.Description = "Counterattack missed attacks with a disarming strike with 30% of melee skill.";
		this.m.Icon = "skills/status_effect_111.png";
		this.m.Type = this.Const.SkillType.Item | this.Const.SkillType.StatusEffect | this.Const.SkillType.Special;
		this.m.IsWeaponSkill = true;
		this.m.IsSerialized = false;
		this.m.IsActive = false;
		this.m.IsHidden = false;
		this.m.IsStacking = true;
		this.m.IsRemovedAfterBattle = false;
		this.m.Order = this.Const.SkillOrder.Perk;
	}

	function onMissed( _attacker, _skill )
	{
		local actor = this.getContainer().getActor();
		if (!_skill.isAttack() || !_attacker.isAlive() || _attacker.isDying() || _attacker.getFaction() == this.Const.Faction.Player || _attacker.getTile().getDistanceTo(actor.getTile()) > 1)
		{
			return;
		}
		actor.getCurrentProperties().MeleeDamageMult *= 0;
		actor.getCurrentProperties().MeleeSkill *= 0.3;

		local hit = this.attackEntity(actor, _attacker, false);
		if(hit)
		{
			if (!_attacker.getCurrentProperties().IsStunned && !_attacker.getCurrentProperties().IsImmuneToDisarm)
			{
				local disarm = this.new("scripts/skills/effects/disarmed_effect");
				_attacker.getSkills().add(disarm);
				this.Tactical.EventLog.log(disarm.getLogEntryOnAdded(this.Const.UI.getColorizedEntityName(actor), this.Const.UI.getColorizedEntityName(_attacker)));
			}
		}
	}
});