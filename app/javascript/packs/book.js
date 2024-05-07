
import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

const handleBookmarkDisplay = (hasBookmarked) => {
	if (hasBookmarked) {
		$('.active-bookmark').removeClass('hidden')
	} else {
		$('.inactive-bookmark').removeClass('hidden')
	}
}

document.addEventListener('turbolinks:load', () => {
	const dataset = $('#book-show').data()
	const bookId = dataset.bookId

	axios.get(`/books/${bookId}/bookmark`)
		.then((response) => {
			const hasBookmarked = response.data.hasBookmarked
			handleBookmarkDisplay(hasBookmarked)
		})

		$('.inactive-bookmark').on('click', () => {
			axios.post(`/books/${bookId}/bookmark`)
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

		$('.active-bookmark').on('click', () => {
			axios.delete(`/books/${bookId}/bookmark`)
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
})
