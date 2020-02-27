
"use strict";

let auto_command_msg = require('./auto_command_msg.js');
let depth_msg = require('./depth_msg.js');
let i2c_msg = require('./i2c_msg.js');
let tools_command_msg = require('./tools_command_msg.js');
let imu_msg = require('./imu_msg.js');
let auto_control_msg = require('./auto_control_msg.js');
let temp_msg = require('./temp_msg.js');
let thrust_command_msg = require('./thrust_command_msg.js');
let thrust_disable_inverted_msg = require('./thrust_disable_inverted_msg.js');
let final_thrust_msg = require('./final_thrust_msg.js');
let can_msg = require('./can_msg.js');
let thrust_status_msg = require('./thrust_status_msg.js');
let controller_msg = require('./controller_msg.js');
let esc_single_msg = require('./esc_single_msg.js');
let pressure_msg = require('./pressure_msg.js');

module.exports = {
  auto_command_msg: auto_command_msg,
  depth_msg: depth_msg,
  i2c_msg: i2c_msg,
  tools_command_msg: tools_command_msg,
  imu_msg: imu_msg,
  auto_control_msg: auto_control_msg,
  temp_msg: temp_msg,
  thrust_command_msg: thrust_command_msg,
  thrust_disable_inverted_msg: thrust_disable_inverted_msg,
  final_thrust_msg: final_thrust_msg,
  can_msg: can_msg,
  thrust_status_msg: thrust_status_msg,
  controller_msg: controller_msg,
  esc_single_msg: esc_single_msg,
  pressure_msg: pressure_msg,
};
