function audio_load_wav(argument0) //gml_Script_audio_load_wav
{
    var _fname = string(argument0)
    if (!file_exists(_fname))
    {
        show_error((("WAV File " + _fname) + " does not exist!"), 1)
        return -1;
    }
    else
    {
        var _buffer = buffer_load(_fname)
        var _soundret = audio_buffer(_buffer, 0)
        buffer_delete(_buffer)
        return _soundret;
    }
}

