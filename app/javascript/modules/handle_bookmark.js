import $ from 'jquery'
import axios from 'modules/axios'

const listenInactiveBookmarkEvent = (bookId) => {
	$('.inactive-bookmark').on('click', () => {
		axios.post(`/api/books/${bookId}/bookmark`)
			.then((response) => {
				if (response.data.status === 'ok') {
					$('.active-bookmark').removeClass('hidden')
					$('.inactive-bookmark').addClass('hidden')
				}
			})
			.catch((e) => {
				window.alert('Error')
				console.log(e)
			})
	})
}

const listenActiveBookmarkEvent = (bookId) => {
	$('.active-bookmark').on('click', () => {
		axios.delete(`/api/books/${bookId}/bookmark`)
			.then((response) => {
				if (response.data.status === 'ok') {
					$('.active-bookmark').addClass('hidden')
					$('.inactive-bookmark').removeClass('hidden')
				}
			})
			.catch((e) => {
				window.alert('Error')
				console.log(e)
			})
	})
}

export {
	listenInactiveBookmarkEvent,
	listenActiveBookmarkEvent
}