this.oo_echo_effect <- this.inherit("scripts/skills/skill", {
	m = {
		Echoed = false
		},

	function create()
	{
		this.m.ID = "effects.oo_echo_effect";
		this.m.Name = "Echo Sidearm";
		this.m.Description = "Oh hit, attack with offhand weapon at 25% effectiveness.";
		this.m.Icon = "skills/status_effect_74.png";
		this.m.Type = this.Const.SkillType.Item | this.Const.SkillType.StatusEffect | this.Const.SkillType.Special;
		this.m.IsWeaponSkill = true;
		this.m.IsSerialized = false;
		this.m.IsActive = false;
		this.m.IsHidden = false;
		this.m.IsStacking = true;
		this.m.IsRemovedAfterBattle = false;
		this.m.Order = this.Const.SkillOrder.Perk;
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if( _targetEntity.isAlive() && !_targetEntity.isDying() && !this.m.Echoed && _targetEntity.getTile().getDistanceTo(this.getContainer().getActor().getTile()) <= 1)
		{
			this.m.Echoed = true;
			local actor = this.getContainer().getActor();
			actor.getCurrentProperties().MeleeDamageMult *= 0.25;
			actor.getCurrentProperties().RangedDamageMult *= 0.25;
			this.attackEntity(actor, _targetEntity, false);
			this.m.Echoed = false;
		}
	}

	function onAfterUpdate( _properties )
	{
		local weapon = this.getContainer().getActor().getMainhandItem();
		if(weapon != null)
		{
			foreach (skill in weapon.getSkills())
			{
				skill.m.FatigueCost += 3;
			}
		}
	}
});