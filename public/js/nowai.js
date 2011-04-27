// Rakaba script, copyright Nowai team 2011, GNU GPL, blah blah

var form_moved 				= false;
var highlighted_post 	= null;
var login 						= false;

$(document).ready(function() {
	$('#motd_button').click(show_motd_form);
	$('#boardlist').hover(boardlist_hover, boardlist_unhover);
	$('#thread_form').submit(submit_thread);
	$('#reply_form').submit(submit_reply);
	$('.post').hover(post_hover, post_unhover);
	$('.post_link a').click(function() {
			id = $(this).html();
			id = id.substring(8, id.length);		
			highlight_post(id);
	});
	$('#reply_form textarea').bind('keydown', 'ctrl+return', function() {
		$(this).submit();
	})
	$('.reply_link').click(move_reply_form);
	$('.delete_link').click(show_delete_menu);
	$('#login_button').click(toggle_login_form);
	$('#login_box form').submit(submit_login);

	// ололо я идиот
	$('.editbox b').click(bold);
	$('.editbox i').click(italic);
	$('.editbox u').click(underline);
	$('.editbox .spoiler').click(spoiler);

	if (document.location.hash != '') {
		highlight_post(document.location.hash.substring(1));
	}
});

function toggle_login_form() {
	box = $('#login_box');
	if (login) {
		box.css('display', 'none');
		login = false;
	}
	else {
		login = true;
		box.css('display', 'table');
		box.find('input[type=password]').focus();
	}
	return false;
}

function submit_login() {
	form = $(this);
	errors = form.find('.errors');
	form.ajaxSubmit({
		beforeSubmit: blur_form(form),
		success: function(reply) {
			if (reply.substring(0, 2) == 'ht') {
				window.location = reply;
			}
			else {
				unblur_form(form);
				errors.html(reply);
			}
		},
		error: function() {
			unblur_form(form);
			alert_error();
		}
	});
	return false;
}

function show_delete_menu() {

}

function show_motd_form() {
	$('#motd_form').css('display', 'block').find('textarea').focus();
	$('#motd').css('display', 'none');
	return false;
}

function highlight_post(id) {
	post = $('#' + id);
	post.addClass('selected');
	if (highlighted_post != null) {
		highlighted_post.removeClass('selected');
	}
	highlighted_post = post;
}

function bold() {
	replace_shit($(this), '**', '**');
}
function italic() {
	replace_shit($(this), '*', '*');
}
function underline() {
	replace_shit($(this), '__', '__');
}
function spoiler() {
	replace_shit($(this), '%%', '%%');
}
function link() {
	href = prompt('Адрес ссылки:');
	if (href.length > 0) {
		replace_shit($(this), '<a href="' + href + '">', '</a>');
	}
}

function replace_shit(hui, opening, ending) {
	textarea = hui.parent().parent().parent().parent().find('textarea');
	initial_value = textarea.val();
	selection = textarea.getSelection()
	left = initial_value.substring(0, selection.start);
	right = initial_value.substring(selection.end, initial_value.length);
	textarea.val(left + opening + selection.text);
	textarea.val(textarea.val() + ending + right);
	caret = selection.end + opening.length
	textarea.focus().caret(caret, caret);
}


function set_caret_to_pos (input, pos) {
  setSelectionRange(input, pos, pos);
}

function boardlist_hover() {
	$(this).find('td.mini').animate({opacity: 1}, 300);
}

function boardlist_unhover() {
	$(this).find('td.mini').animate({opacity: 0}, 300);
}

function delete_post() {
	if (confirm('Вы хотите удалить этот пост?')) {
		// удаление поста
	}
	return false;
}

function post_hover() {
	$(this).find('.delete_link').css('opacity', '1');
}

function post_unhover() {
	$(this).find('.delete_link').css('opacity', '0');
}

function blur_form(form) {
	form.css('opacity', '0.6');
	form.find('textarea').blur();
	form.find('.errors').html('');
	form.find('input').blur();
	form.find('#submit_button').attr('disabled', true);
}

function unblur_form(form) {
	form.css('opacity', '1');
	form.find('#submit_button').removeAttr('disabled');
}

function clear_form(form) {
	form.find('textarea').val('');
	form.find('#sage').removeAttr('checked');
	form.find('#file').val('');
}

function submit_thread() {
	form 		= $('#thread_form');
	button	= form.find('#submit_button');
	errors	= form.find('.errors');
	form.ajaxSubmit({
		beforeSubmit: blur_form(form),
		success: function(reply) {
			if (reply.substring(0, 1) == 'h') {
				// Все ок, пришла ссылка на новый тред
				window.location = reply;
			} 
			else {
				// Ошибка
				unblur_form(form);
				errors.html(reply);
			}
		}, 
		error: function() {
			unblur_form(form);
			erorrs.html('');
			alert_error();
		}
	});
	return false;
}

function submit_reply() {
	form 		= $('#reply_form');
	button	= form.find('#submit_button');
	errors	= form.find('.errors');
	thread	= form.parent().parent();
	form.ajaxSubmit({
		beforeSubmit: blur_form(form),
		success: function(reply) {
			if (reply.substring(0, 2) == '<d') {
				// Пришел HTML с телом поста, надо его показать
				unblur_form(form);
				clear_form(form);
				post = $(reply);
				if (current_location == 'thread') {
					thread.append(post);
					post.after(form.parent());
					form_moved = false;
				} 
				else {
					if (thread.find('.post').length == 3) {
						thread.find('.post:first').remove();
					}
					thread.append(post);
					form.parent().css('display', 'none');
					omitted = thread.find('.omitted b');
					number = omitted.html();
					number = parseInt(number);
					number += 1
					omitted.html(number);
				}
				$.scrollTo(post, settings={offset:{top:-200}});
				post.css('opacity', '0');
				post.animate({opacity: 1}, 800)
				$('.reply_link').unbind().click(move_reply_form);
				$('.post').unbind().hover(post_hover, post_unhover);
			}
			else if (reply.substring(0, 2) == 'ht') {
				// Пришла ссылка, переходим по ней
				window.location = reply;
			}
			else {
				// Ошибка, блядь!
				unblur_form(form);
				errors.html(reply);
			}
		},
		error: function() {
			unblur_form(form);
			form.find('.errors').html('');
			alert_error();
		}
	});
	return false;
}

function alert_error() {
	alert("Что-то пошло не так. \
		Либо проблемы на сервере, либо у вас с соединением.");
}

function move_reply_form() {
	container = $('#reply_form_container');
	post 			= $(this).parent().parent();
	textarea	= container.find('textarea');
	container.css('display', 'table');
	post.after(container);
	textarea.focus();
	textarea.val(textarea.val() + '>>' + post.attr('id') + ' ');
	if (current_location == 'board') {
		if (post.attr('class') == 'post') {
			thread_id = post.parent().find('.thread').attr('id');
		}
		else {
			thread_id	= post.attr('id');
		}
		action = thread_id + '/reply'
		container.find('form').attr('action', action);
	}
	else {
		form_moved = true;
	}
	$.scrollTo(post, settings={offset:{top:-200}})
	return false;
}

