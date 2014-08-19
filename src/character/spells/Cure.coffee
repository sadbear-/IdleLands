
Spell = require "../base/Spell"

class Cure extends Spell
  name: "cure"
  @element = Cure::element = Spell::Element.heal
  @cost = Cure::cost = 50
  @restrictions =
    "Cleric": 5

  determineTargets: ->
    @targetFriendly()

  calcDamage: ->
    minStat = (@caster.calc.stat 'wis')/4
    maxStat = @caster.calc.stat 'wis'
    super() + @minMax minStat, maxStat

  cast: (player) ->
    damage = @calcDamage()
    message = "#{@caster.name} cast #{@name} at #{player.name} and healed %damage HP!"
    @doDamageTo player, -damage, message

  constructor: (@game, @caster) ->
    super @game, @caster
    @bindings =
      doSpellCast: @cast

module.exports = exports = Cure
