this.oo_bleed_effect <- this.inherit("scripts/skills/skill", {

	function create()
	{
		this.m.ID = "effects.oo_bleed_effect";
		this.m.Name = "Bleeding Sidearm";
		this.m.Description = "On hit, applies an additional stack of bleeding to the target.";
		this.m.Icon = "skills/status_effect_01.png";
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
		if( _targetEntity.isAlive() && !_targetEntity.isDying() && _damageInflictedHitpoints >= 1 && !_targetEntity.getCurrentProperties().IsImmuneToBleeding && _targetEntity.getTile().getDistanceTo(this.getContainer().getActor().getTile()) <= 1)
		{
			local effect = this.new("scripts/skills/effects/bleeding_effect");
			effect.setDamage(1);
			_targetEntity.getSkills().add(effect);
		}
	}

	function onAfterUpdate( _properties )
	{
		local weapon = this.getContainer().getActor().getMainhandItem();
		if(weapon != null)
		{
			foreach (skill in weapon.getSkills())
			{
				skill.m.FatigueCost += 2;
			}
		}
	}
});