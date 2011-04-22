var form_moved = false;

$(document).ready(function() {
	$('#thread_form').submit(submit_thread);
	$('#reply_form').submit(submit_reply);
	$('.reply_link').click(move_reply_form);
});

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
					$.scrollTo(post);
				} 
				else {
					if (thread.find('.post').length == 3) {
						thread.find('.post:first').remove();
					}
					thread.append(post);
					form.parent().css('display', 'none');
					omitted = thread.find('.omitted span');
					number = omitted.html();
					number = parseInt(number);
					number += 1
					omitted.html(number);
				}
			}
			else if (reply.substring(0, 2) == 'ht') {
				// Пришла ссылка, переходим по ней
				window.location = reply;
			}
			else {
				// Ошибка, блядь!
				unblur_form(form);
				errors.html(errors);
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
		action = thread_id + '.html/reply'
		container.find('form').attr('action', action);
	}
	else {
		form_moved = true;
	}
	return false;
}

