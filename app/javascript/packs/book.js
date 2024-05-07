import $ from 'jquery'
import axios from 'modules/axios'
import {
	listenInactiveBookmarkEvent,
	listenActiveBookmarkEvent
} from 'modules/handle_bookmark'

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

		listenInactiveBookmarkEvent(bookId)
		listenActiveBookmarkEvent(bookId)
})
