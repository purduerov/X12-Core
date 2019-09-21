import React from 'react';
import './titlebar.css';
import PropTypes from 'prop-types';

class Titlebar extends React.Component {
	constructor(props) {
		super(props);
		this.state = { text: props.title || 'Purdue ROV 2019' };
	}

	render() {
		return (
			<div className='title'>
				{this.state.text}
			</div>
		);
	}
}

Titlebar.propTypes = {
	title: PropTypes.string.isRequired
};

export default Titlebar;
