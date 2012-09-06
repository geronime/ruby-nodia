#encoding:utf-8
require 'unicode_utils/nfkd'

require 'ruby-nodia/version'

module NoDia

	def self.strip s
		rslt = String.new s
		# remove blacklisted characters
		rslt.gsub! BLACKLIST_RGX, ''
		# pre-nfkd substitutions
		PRE_GSUB.each{|pattern, replace| rslt.gsub! pattern, replace }
		# nfkd
		rslt = UnicodeUtils.nfkd rslt
		# post-nfkd substitutions
		POST_GSUB.each{|pattern, replace| rslt.gsub! pattern, replace }
		# post-nfkd tr
		rslt.tr!(*POST_TR)
		# remove everything non-ascii
		rslt.gsub! STRIP_RGX, ''
		return rslt
	end # strip

	private

	# characters to be removed, not to be translated. TODO add more?
	BLACKLIST_RGX = %r{[©®™]}
	# substitutions to be done before Unicode NFD
	PRE_GSUB      = [
		[%r{ä}, 'ae'],
		[%r{ñ}, 'ny'],
		[%r{ö}, 'oe'],
		[%r{ü}, 'ue'],
		[%r{ÿ}, 'yu'],
	]
	# substitutions to be done after Unicode NFD
	POST_GSUB     = [
		[%r{ß}, 'ss'],
		[%r{Æ}, 'AE'],
		[%r{æ}, 'ae'],
		[%r{Ĳ}, 'IJ'],
		[%r{ĳ}, 'ij'],
		[%r{Œ}, 'Oe'],
		[%r{œ}, 'oe'],
	]
	# transliteration to be done after Unicode NFD
	POST_TR       = ['ÐĐðđĦħıĸĿŁŀłŊŉŋØøſÞŦþŧ', 'DDddHhikLLllNnnOosTTtt']
	# regexp to remove all remaining non-ascii characters
	STRIP_RGX     = %r{[^\x00-\x7F]+}

end # NoDia

