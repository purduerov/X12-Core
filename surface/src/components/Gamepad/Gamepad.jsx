import React from 'react';
import './Gamepad.css';
import { Button, Row, Col } from 'react-bootstrap';
import {ipcRenderer} from 'electron';

const CALIBRATE_CALL = 'calibrate-gamepad';

class Gamepad extends React.Component {
	constructor(props) {
		super(props);
		this.state = require('../../electron/gamepad/layout.json');
		this.calibrateClick = this.calibrateClick.bind(this);
	}

	calibrateClick(){
		ipcRenderer.send(CALIBRATE_CALL);
	}


	render() {
		return (
			<Col>
				<Row style={{height: '30%'}}>
					<Button onClick={this.calibrateClick}>Calibrate</Button>
				</Row>
				<Row style={{height: '70%'}}>
					Output will go here
				</Row>
			</Col>
		);
	}
}

export default Gamepad;
