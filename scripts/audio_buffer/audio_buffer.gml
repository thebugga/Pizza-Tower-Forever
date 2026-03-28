var _retarr;
function audio_buffer(argument0, argument1) //gml_Script_audio_buffer
{
    var _mainbuf = argument0
    var _offset = 0
    if (argument_count > 1)
        _offset = argument1
    if (!buffer_exists(_mainbuf))
    {
        show_error("Unable to load WAV File.", 1)
        return -1;
    }
    buffer_seek(_mainbuf, buffer_seek_start, _offset)
    var _RIFF = 1179011410
    var _fRIFF = buffer_read(_mainbuf, buffer_u32)
    if (_fRIFF != _RIFF)
    {
        buffer_delete(_mainbuf)
        show_error(("Invalid RIFF header, got " + string(_fRIFF)), 1)
        return -1;
    }
    buffer_read(_mainbuf, buffer_u32)
    var _WAVE = 1163280727
    var _fWAVE = buffer_read(_mainbuf, buffer_u32)
    if (_fWAVE != _WAVE)
    {
        show_error(("Invalid WAVE header, got " + string(_fWAVE)), 1)
        return -1;
    }
    var _FMT = 544501094
    var _fFMT = buffer_read(_mainbuf, buffer_u32)
    if (_fFMT != _FMT)
    {
        show_error(("Invalid fmt  header, got " + string(_fFMT)), 1)
        return -1;
    }
    buffer_read(_mainbuf, buffer_u32)
    var _PCMAUDIOFMT = 1
    var _AUDIOFMT = buffer_read(_mainbuf, buffer_u16)
    if (_AUDIOFMT != _PCMAUDIOFMT)
    {
        show_error(("GM:S 1.4/GMS 2 only supports PCM audio format, got " + string(_AUDIOFMT)), 1)
        return -1;
    }
    var _ChanNum = buffer_read(_mainbuf, buffer_u16)
    var _SampFrq = buffer_read(_mainbuf, buffer_u32)
    var _BytsPsq = buffer_read(_mainbuf, buffer_u32)
    var _BlokAln = buffer_read(_mainbuf, buffer_u16)
    var _BitsPsq = buffer_read(_mainbuf, buffer_u16)
    switch _BitsPsq
    {
        case 16:
            var _GMBitsPsq = 4
            break
        case 8:
            _GMBitsPsq = 1
            break
        default:
            show_error(("Invalid Bits Per Second value, got " + string(_BitsPsq)), 1)
            return -1;
    }

    switch _ChanNum
    {
        case 1:
            var _GMChanNum = 0
            break
        case 2:
            _GMChanNum = 1
            break
        default:
            _GMChanNum = 2
            show_debug_message((("Invalid channel num " + string(_ChanNum)) + ", assuming 3D (5.1) Audio..."))
            break
    }

    var _DATA = 1635017060
    var _fDATA = buffer_read(_mainbuf, buffer_u32)
    if (_fDATA != _DATA)
    {
        show_error(("Invalid data header, got " + string(_fDATA)), 1)
        return -1;
    }
    var _DataLen = buffer_read(_mainbuf, buffer_u32)
    if (_DataLen != (buffer_get_size(_mainbuf) - buffer_tell(_mainbuf)))
        show_debug_message("Extra data after the end of the file.")
    show_debug_message("Parsed everything, trying to make the sound...")
    var _buf = buffer_create(_DataLen, buffer_fixed, _BlokAln)
    buffer_copy(_mainbuf, buffer_tell(_mainbuf), _DataLen, _buf, 0)
    var _sound = audio_create_buffer_sound(_buf, _GMBitsPsq, _SampFrq, 0, _DataLen, _GMChanNum)
    _retarr[1] = _buf
    _retarr[0] = _sound
    return _retarr;
}

