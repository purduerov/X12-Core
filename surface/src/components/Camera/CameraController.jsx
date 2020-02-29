import React, { Component } from 'react';
import { Button, Col, Container } from 'react-bootstrap';
import CameraConfig from './camera.json';


export default class CameraController extends Component {
	render() {
		return (
			<div>
				{CameraConfig.map((camera, idx) => {
					return (
						<Button key={idx}>
							{camera.name}
						</Button>
					);
				})}
			</div>
		);
	}
}
