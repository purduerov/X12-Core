import React from 'react';
import { Col, Row, Container } from 'react-bootstrap';

class Camera extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			cameras: [
				{
					url: 'url1'
				},
				{
					url: 'url2'
				},
				{
					url: 'url3'
				},
				{
					url: 'url4'
				},
				{
					url: 'url5'
				}
			]
		};
	}

	render() {
		return (
			<Container>
				<Row style={{height: '80%'}}>
					Feed 1
				</Row>
				<Row style={{height: '20%'}}>
					<Col>
						Feed 332
					</Col>
					<Col>
						Feed 3
					</Col>
					<Col>
						Feed 4
					</Col>
					<Col>
						Feed 5
					</Col>
				</Row>
			</Container>
		);
	}
}

export default Camera;
