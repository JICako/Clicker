extends Node

@export var _money: Label #total money
@export var _mpc: Label #money_per_click
@export var _mps: Label #money_per_sec
@export var _prest: Label

@export var _mpc_price: Label #price_money_per_click
@export var _mps_price: Label #price_money_per_sec

@export var _click_btn: Button #main_button
@export var _mpc_btn: Button #buy_mpc_button
@export var _mps_btn: Button #buy_mps_button
@export var _prest_btn: Button

var money = 100000
var mpc = 1
var mps = 0
var prest = 0.1

var mpc_b_price = 10
var coef_mpc = 1.2
var lvl_mpc = 0
var bp_mpc = 1

var mps_b_price = 50
var coef_mps = 2.0
var lvl_mps = 0
var mps_timer = 1
var bp_mps = 1

func _ready():
	update_display()
	
func _on_clicker_pressed():
	money += mpc
	update_display()

func _on_upgrade_click_pressed():
	var mpc_price = mpc_b_price * pow(coef_mpc, lvl_mpc)
	if money >= mpc_price:
		money -= mpc_price
		lvl_mpc += 1
		mpc += bp_mpc * lvl_mpc
		update_display()


func _on_upgrade_per_sec_pressed():
	var mps_price = mps_b_price * pow(coef_mps, lvl_mps)
	if money >= mps_price:
		money -= mps_price
		lvl_mps += 1
		mps += bp_mps * lvl_mps
		update_display()

func _process(delta):
	mps_timer += delta
	if mps_timer >= 1.0:
		mps_timer = 0
		money += mps
		update_display()
	

func update_display():
	var mps_price = mps_b_price * pow(coef_mps, lvl_mps)
	var mpc_price = mpc_b_price * pow(coef_mpc, lvl_mpc)
	
	_money.text = "%.2f$" % money
	_mpc.text = "%.2f$/click" % mpc
	_mps.text = "%.2f$/sec" % mps
	_mpc_price.text = "%.2f$" % mpc_price
	_mps_price.text = "%.2f$" % mps_price
	_prest.text = "%.2fPP" % prest

func _on_prest_pressed() -> void:
	if money >= 100000:
		prest = prest + (1000000 / money)
		
		money = 0
		mpc = 1 + prest
		mps = 0
		
		mpc_b_price = 10
		coef_mpc = 1.2
		lvl_mpc = 0
		bp_mpc = bp_mpc + 0.2
		
		mps_b_price = 50
		coef_mps = 2.0
		lvl_mps = 0
		bp_mps = bp_mps + 0.2
		
		update_display()


func _on_cheat_pressed() -> void:
	money = 100000
