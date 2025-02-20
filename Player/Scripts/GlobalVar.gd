extends Node
var MaxHealth = 100
var HealthPoints = MaxHealth
var Neutrinos = 0 
var Deck = [
	{"Name": "Basic Attack","Attack": 7,"Block": 0,"Cost": 1,"Special": 0, "Description": "A basic attack. Deals 7 damage on hit."},
	{"Name": "Basic Attack","Attack": 7,"Block": 0,"Cost": 1,"Special": 0, "Description": "A basic attack. Deals 7 damage on hit."},
	{"Name": "Basic Attack","Attack": 7,"Block": 0,"Cost": 1,"Special": 0, "Description": "A basic attack. Deals 7 damage on hit."},
	{"Name": "Basic Attack","Attack": 7,"Block": 0,"Cost": 1,"Special": 0, "Description": "A basic attack. Deals 7 damage on hit."},
	{"Name": "Basic Attack","Attack": 7,"Block": 0,"Cost": 1,"Special": 0, "Description": "A basic attack. Deals 7 damage on hit."},
	{"Name": "Basic Attack","Attack": 7,"Block": 0,"Cost": 1,"Special": 0, "Description": "A basic attack. Deals 7 damage on hit."},
	{"Name": "Basic Attack","Attack": 7,"Block": 0,"Cost": 1,"Special": 0, "Description": "A basic attack. Deals 7 damage on hit."},
	{"Name": "Basic Block","Attack": 0,"Block": 7,"Cost": 1,"Special": 0, "Description": "A basic Block. Prevents 7 damage."},
	{"Name": "Basic Block","Attack": 0,"Block": 7,"Cost": 1,"Special": 0, "Description": "A basic Block. Prevents 7 damage."},
	{"Name": "Basic Block","Attack": 0,"Block": 7,"Cost": 1,"Special": 0, "Description": "A basic Block. Prevents 7 damage."},
	{"Name": "Basic Block","Attack": 0,"Block": 7,"Cost": 1,"Special": 0, "Description": "A basic Block. Prevents 7 damage."},
	{"Name": "Basic Block","Attack": 0,"Block": 7,"Cost": 1,"Special": 0, "Description": "A basic Block. Prevents 7 damage."},
	{"Name": "Basic Block","Attack": 0,"Block": 7,"Cost": 1,"Special": 0, "Description": "A basic Block. Prevents 7 damage."},
	{"Name": "Basic Block","Attack": 0,"Block": 7,"Cost": 1,"Special": 0, "Description": "A basic Block. Prevents 7 damage."},
	{"Name": "Heavy Attack","Attack": 20,"Block": -5,"Cost": 2,"Special": 0, "Description": "A heavy and strong but exausting hit... +violence."},
	{"Name": "Heavy Attack","Attack": 20,"Block": -5,"Cost": 2,"Special": 0, "Description": "A heavy and strong but exausting hit... +violence."},
	{"Name": "Heavy Attack","Attack": 20,"Block": -5,"Cost": 2,"Special": 0, "Description": "A heavy and strong but exausting hit... +violence."},
	{"Name": "Heavy Block","Attack": 0,"Block": 20,"Cost": 2,"Special": 0, "Description": "A slowing but firm block... +focus"},
	{"Name": "Heavy Block","Attack": 0,"Block": 20,"Cost": 2,"Special": 0, "Description": "A slowing but firm block... +focus"},
	{"Name": "Heavy Block","Attack": 0,"Block": 20,"Cost": 2,"Special": 0, "Description": "A slowing but firm block... +focus"},
	{"Name": "Block Bash","Attack": 10,"Block": 10,"Cost": 2,"Special": 0},
	{"Name": "Block Bash","Attack": 10,"Block": 10,"Cost": 2,"Special": 0},
	
]
var CommonCards: Array
var UncommonCards: Array
var RareCards: Array
var LegendaryCards: Array
var BossCards: Array
var ForbiddenCards: Array
var ContractCards: Array
func _ready() -> void:
	var DeckCounter
	for i in Deck:
		print(i["Name"] + " " + str(i["Attack"]) + " " + str(i["Block"]) + " " + str(i["Cost"]) + " " + str(i["Special"]))
