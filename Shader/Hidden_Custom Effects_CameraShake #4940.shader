//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Custom Effects/CameraShake" {
Properties {
}
SubShader {
 Pass {
  Name "CameraShake"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 25214
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	float _RenderViewportScaleFactor;
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec2 _ScanLineJitter;
uniform 	vec2 _VerticalJump;
uniform 	float _HorizontalShake;
uniform 	vec2 _ColorDrift;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
bool u_xlatb3;
float u_xlat6;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.y;
    u_xlat0.yz = _Time.xx;
    u_xlat0.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 43758.5469;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 2.0 + -1.0;
    u_xlatb3 = abs(u_xlat0.x)>=_ScanLineJitter.y;
    u_xlat3 = u_xlatb3 ? 1.0 : float(0.0);
    u_xlat3 = u_xlat3 * _ScanLineJitter.x;
    u_xlat0.x = u_xlat0.x * u_xlat3 + vs_TEXCOORD0.x;
    u_xlat0.w = 2.0;
    u_xlat3 = dot(u_xlat0.zw, vec2(12.9898005, 78.2330017));
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = u_xlat3 * 43758.5469;
    u_xlat3 = fract(u_xlat3);
    u_xlat3 = u_xlat3 + -0.5;
    u_xlat0.x = u_xlat3 * _HorizontalShake + u_xlat0.x;
    u_xlat3 = vs_TEXCOORD0.y + _VerticalJump.xxxy.w;
    u_xlat3 = fract(u_xlat3);
    u_xlat3 = u_xlat3 + (-vs_TEXCOORD0.y);
    u_xlat0.y = _VerticalJump.xxxy.z * u_xlat3 + vs_TEXCOORD0.y;
    u_xlat6 = u_xlat0.y + _ColorDrift.xxyx.z;
    u_xlat1.xyw = fract(u_xlat0.xyy);
    u_xlat3 = sin(u_xlat6);
    u_xlat3 = u_xlat3 * _ColorDrift.xxyx.y + u_xlat0.x;
    u_xlat2 = texture(_MainTex, u_xlat1.xy);
    SV_Target0.xz = u_xlat2.xz;
    u_xlat1.z = fract(u_xlat3);
    u_xlat0 = texture(_MainTex, u_xlat1.zw);
    SV_Target0.y = u_xlat0.y;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 67
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %45 %55 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD1 Location 45 
                                             OpMemberDecorate %47 0 Offset 47 
                                             OpDecorate %47 Block 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate vs_TEXCOORD0 Location 55 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypeInt 32 0 
                                  u32 %9 = OpConstant 1 
                                     %10 = OpTypeArray %6 %9 
                                     %11 = OpTypeStruct %7 %6 %10 
                                     %12 = OpTypePointer Output %11 
Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypeVector %6 3 
                                     %17 = OpTypePointer Input %16 
                        Input f32_3* %18 = OpVariable Input 
                                     %19 = OpTypeVector %6 2 
                                     %22 = OpTypePointer Output %7 
                                 f32 %26 = OpConstant 3.674022E-40 
                                 f32 %27 = OpConstant 3.674022E-40 
                               f32_2 %28 = OpConstantComposite %26 %27 
                                     %32 = OpTypePointer Private %19 
                      Private f32_2* %33 = OpVariable Private 
                               f32_2 %36 = OpConstantComposite %27 %27 
                                 f32 %39 = OpConstant 3.674022E-40 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_2 %41 = OpConstantComposite %39 %40 
                                     %44 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                     %47 = OpTypeStruct %6 
                                     %48 = OpTypePointer Uniform %47 
              Uniform struct {f32;}* %49 = OpVariable Uniform 
                                     %50 = OpTypePointer Uniform %6 
              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                               f32_2 %59 = OpConstantComposite %39 %39 
                                     %61 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_3 %20 = OpLoad %18 
                               f32_2 %21 = OpVectorShuffle %20 %20 0 1 
                       Output f32_4* %23 = OpAccessChain %13 %15 
                               f32_4 %24 = OpLoad %23 
                               f32_4 %25 = OpVectorShuffle %24 %21 4 5 2 3 
                                             OpStore %23 %25 
                       Output f32_4* %29 = OpAccessChain %13 %15 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpVectorShuffle %30 %28 0 1 4 5 
                                             OpStore %29 %31 
                               f32_3 %34 = OpLoad %18 
                               f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               f32_2 %37 = OpFAdd %35 %36 
                                             OpStore %33 %37 
                               f32_2 %38 = OpLoad %33 
                               f32_2 %42 = OpFMul %38 %41 
                               f32_2 %43 = OpFAdd %42 %28 
                                             OpStore %33 %43 
                               f32_2 %46 = OpLoad %33 
                        Uniform f32* %51 = OpAccessChain %49 %15 
                                 f32 %52 = OpLoad %51 
                               f32_2 %53 = OpCompositeConstruct %52 %52 
                               f32_2 %54 = OpFMul %46 %53 
                                             OpStore vs_TEXCOORD1 %54 
                               f32_3 %56 = OpLoad %18 
                               f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                               f32_2 %58 = OpFMul %57 %41 
                               f32_2 %60 = OpFAdd %58 %59 
                                             OpStore vs_TEXCOORD0 %60 
                         Output f32* %62 = OpAccessChain %13 %15 %9 
                                 f32 %63 = OpLoad %62 
                                 f32 %64 = OpFNegate %63 
                         Output f32* %65 = OpAccessChain %13 %15 %9 
                                             OpStore %65 %64 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 194
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %171 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate vs_TEXCOORD0 Location 12 
                                                      OpMemberDecorate %21 0 Offset 21 
                                                      OpMemberDecorate %21 1 Offset 21 
                                                      OpMemberDecorate %21 2 Offset 21 
                                                      OpMemberDecorate %21 3 Offset 21 
                                                      OpMemberDecorate %21 4 Offset 21 
                                                      OpDecorate %21 Block 
                                                      OpDecorate %23 DescriptorSet 23 
                                                      OpDecorate %23 Binding 23 
                                                      OpDecorate %156 DescriptorSet 156 
                                                      OpDecorate %156 Binding 156 
                                                      OpDecorate %160 DescriptorSet 160 
                                                      OpDecorate %160 Binding 160 
                                                      OpDecorate %171 Location 171 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypePointer Input %10 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                              %13 = OpTypeInt 32 0 
                                          u32 %14 = OpConstant 1 
                                              %15 = OpTypePointer Input %6 
                                          u32 %18 = OpConstant 0 
                                              %19 = OpTypePointer Private %6 
                                              %21 = OpTypeStruct %7 %10 %10 %6 %10 
                                              %22 = OpTypePointer Uniform %21 
Uniform struct {f32_4; f32_2; f32_2; f32; f32_2;}* %23 = OpVariable Uniform 
                                              %24 = OpTypeInt 32 1 
                                          i32 %25 = OpConstant 0 
                                              %26 = OpTypePointer Uniform %7 
                                          f32 %34 = OpConstant 3.674022E-40 
                                          f32 %35 = OpConstant 3.674022E-40 
                                        f32_2 %36 = OpConstantComposite %34 %35 
                                          f32 %45 = OpConstant 3.674022E-40 
                                          f32 %54 = OpConstant 3.674022E-40 
                                          f32 %56 = OpConstant 3.674022E-40 
                                              %59 = OpTypeBool 
                                              %60 = OpTypePointer Private %59 
                                Private bool* %61 = OpVariable Private 
                                          i32 %65 = OpConstant 1 
                                              %66 = OpTypePointer Uniform %6 
                                 Private f32* %70 = OpVariable Private 
                                          f32 %72 = OpConstant 3.674022E-40 
                                          f32 %73 = OpConstant 3.674022E-40 
                                          u32 %87 = OpConstant 3 
                                          f32 %99 = OpConstant 3.674022E-40 
                                         i32 %102 = OpConstant 3 
                                         i32 %112 = OpConstant 2 
                                Private f32* %131 = OpVariable Private 
                                         i32 %134 = OpConstant 4 
                              Private f32_4* %138 = OpVariable Private 
                                             %139 = OpTypeVector %6 3 
                                             %154 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %155 = OpTypePointer UniformConstant %154 
        UniformConstant read_only Texture2D* %156 = OpVariable UniformConstant 
                                             %158 = OpTypeSampler 
                                             %159 = OpTypePointer UniformConstant %158 
                    UniformConstant sampler* %160 = OpVariable UniformConstant 
                                             %162 = OpTypeSampledImage %154 
                                             %170 = OpTypePointer Output %7 
                               Output f32_4* %171 = OpVariable Output 
                                         u32 %178 = OpConstant 2 
                                             %190 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                   Input f32* %16 = OpAccessChain vs_TEXCOORD0 %14 
                                          f32 %17 = OpLoad %16 
                                 Private f32* %20 = OpAccessChain %9 %18 
                                                      OpStore %20 %17 
                               Uniform f32_4* %27 = OpAccessChain %23 %25 
                                        f32_4 %28 = OpLoad %27 
                                        f32_2 %29 = OpVectorShuffle %28 %28 0 0 
                                        f32_4 %30 = OpLoad %9 
                                        f32_4 %31 = OpVectorShuffle %30 %29 0 4 5 3 
                                                      OpStore %9 %31 
                                        f32_4 %32 = OpLoad %9 
                                        f32_2 %33 = OpVectorShuffle %32 %32 0 1 
                                          f32 %37 = OpDot %33 %36 
                                 Private f32* %38 = OpAccessChain %9 %18 
                                                      OpStore %38 %37 
                                 Private f32* %39 = OpAccessChain %9 %18 
                                          f32 %40 = OpLoad %39 
                                          f32 %41 = OpExtInst %1 13 %40 
                                 Private f32* %42 = OpAccessChain %9 %18 
                                                      OpStore %42 %41 
                                 Private f32* %43 = OpAccessChain %9 %18 
                                          f32 %44 = OpLoad %43 
                                          f32 %46 = OpFMul %44 %45 
                                 Private f32* %47 = OpAccessChain %9 %18 
                                                      OpStore %47 %46 
                                 Private f32* %48 = OpAccessChain %9 %18 
                                          f32 %49 = OpLoad %48 
                                          f32 %50 = OpExtInst %1 10 %49 
                                 Private f32* %51 = OpAccessChain %9 %18 
                                                      OpStore %51 %50 
                                 Private f32* %52 = OpAccessChain %9 %18 
                                          f32 %53 = OpLoad %52 
                                          f32 %55 = OpFMul %53 %54 
                                          f32 %57 = OpFAdd %55 %56 
                                 Private f32* %58 = OpAccessChain %9 %18 
                                                      OpStore %58 %57 
                                 Private f32* %62 = OpAccessChain %9 %18 
                                          f32 %63 = OpLoad %62 
                                          f32 %64 = OpExtInst %1 4 %63 
                                 Uniform f32* %67 = OpAccessChain %23 %65 %14 
                                          f32 %68 = OpLoad %67 
                                         bool %69 = OpFOrdGreaterThanEqual %64 %68 
                                                      OpStore %61 %69 
                                         bool %71 = OpLoad %61 
                                          f32 %74 = OpSelect %71 %72 %73 
                                                      OpStore %70 %74 
                                          f32 %75 = OpLoad %70 
                                 Uniform f32* %76 = OpAccessChain %23 %65 %18 
                                          f32 %77 = OpLoad %76 
                                          f32 %78 = OpFMul %75 %77 
                                                      OpStore %70 %78 
                                 Private f32* %79 = OpAccessChain %9 %18 
                                          f32 %80 = OpLoad %79 
                                          f32 %81 = OpLoad %70 
                                          f32 %82 = OpFMul %80 %81 
                                   Input f32* %83 = OpAccessChain vs_TEXCOORD0 %18 
                                          f32 %84 = OpLoad %83 
                                          f32 %85 = OpFAdd %82 %84 
                                 Private f32* %86 = OpAccessChain %9 %18 
                                                      OpStore %86 %85 
                                 Private f32* %88 = OpAccessChain %9 %87 
                                                      OpStore %88 %54 
                                        f32_4 %89 = OpLoad %9 
                                        f32_2 %90 = OpVectorShuffle %89 %89 2 3 
                                          f32 %91 = OpDot %90 %36 
                                                      OpStore %70 %91 
                                          f32 %92 = OpLoad %70 
                                          f32 %93 = OpExtInst %1 13 %92 
                                                      OpStore %70 %93 
                                          f32 %94 = OpLoad %70 
                                          f32 %95 = OpFMul %94 %45 
                                                      OpStore %70 %95 
                                          f32 %96 = OpLoad %70 
                                          f32 %97 = OpExtInst %1 10 %96 
                                                      OpStore %70 %97 
                                          f32 %98 = OpLoad %70 
                                         f32 %100 = OpFAdd %98 %99 
                                                      OpStore %70 %100 
                                         f32 %101 = OpLoad %70 
                                Uniform f32* %103 = OpAccessChain %23 %102 
                                         f32 %104 = OpLoad %103 
                                         f32 %105 = OpFMul %101 %104 
                                Private f32* %106 = OpAccessChain %9 %18 
                                         f32 %107 = OpLoad %106 
                                         f32 %108 = OpFAdd %105 %107 
                                Private f32* %109 = OpAccessChain %9 %18 
                                                      OpStore %109 %108 
                                  Input f32* %110 = OpAccessChain vs_TEXCOORD0 %14 
                                         f32 %111 = OpLoad %110 
                                Uniform f32* %113 = OpAccessChain %23 %112 %14 
                                         f32 %114 = OpLoad %113 
                                         f32 %115 = OpFAdd %111 %114 
                                                      OpStore %70 %115 
                                         f32 %116 = OpLoad %70 
                                         f32 %117 = OpExtInst %1 10 %116 
                                                      OpStore %70 %117 
                                         f32 %118 = OpLoad %70 
                                  Input f32* %119 = OpAccessChain vs_TEXCOORD0 %14 
                                         f32 %120 = OpLoad %119 
                                         f32 %121 = OpFNegate %120 
                                         f32 %122 = OpFAdd %118 %121 
                                                      OpStore %70 %122 
                                Uniform f32* %123 = OpAccessChain %23 %112 %18 
                                         f32 %124 = OpLoad %123 
                                         f32 %125 = OpLoad %70 
                                         f32 %126 = OpFMul %124 %125 
                                  Input f32* %127 = OpAccessChain vs_TEXCOORD0 %14 
                                         f32 %128 = OpLoad %127 
                                         f32 %129 = OpFAdd %126 %128 
                                Private f32* %130 = OpAccessChain %9 %14 
                                                      OpStore %130 %129 
                                Private f32* %132 = OpAccessChain %9 %14 
                                         f32 %133 = OpLoad %132 
                                Uniform f32* %135 = OpAccessChain %23 %134 %14 
                                         f32 %136 = OpLoad %135 
                                         f32 %137 = OpFAdd %133 %136 
                                                      OpStore %131 %137 
                                       f32_4 %140 = OpLoad %9 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 1 
                                       f32_3 %142 = OpExtInst %1 10 %141 
                                       f32_4 %143 = OpLoad %138 
                                       f32_4 %144 = OpVectorShuffle %143 %142 4 5 2 6 
                                                      OpStore %138 %144 
                                         f32 %145 = OpLoad %131 
                                         f32 %146 = OpExtInst %1 13 %145 
                                                      OpStore %70 %146 
                                         f32 %147 = OpLoad %70 
                                Uniform f32* %148 = OpAccessChain %23 %134 %18 
                                         f32 %149 = OpLoad %148 
                                         f32 %150 = OpFMul %147 %149 
                                Private f32* %151 = OpAccessChain %9 %18 
                                         f32 %152 = OpLoad %151 
                                         f32 %153 = OpFAdd %150 %152 
                                                      OpStore %70 %153 
                         read_only Texture2D %157 = OpLoad %156 
                                     sampler %161 = OpLoad %160 
                  read_only Texture2DSampled %163 = OpSampledImage %157 %161 
                                       f32_4 %164 = OpLoad %138 
                                       f32_2 %165 = OpVectorShuffle %164 %164 0 1 
                                       f32_4 %166 = OpImageSampleImplicitLod %163 %165 
                                       f32_2 %167 = OpVectorShuffle %166 %166 0 2 
                                       f32_4 %168 = OpLoad %9 
                                       f32_4 %169 = OpVectorShuffle %168 %167 4 1 5 3 
                                                      OpStore %9 %169 
                                       f32_4 %172 = OpLoad %9 
                                       f32_2 %173 = OpVectorShuffle %172 %172 0 2 
                                       f32_4 %174 = OpLoad %171 
                                       f32_4 %175 = OpVectorShuffle %174 %173 4 1 5 3 
                                                      OpStore %171 %175 
                                         f32 %176 = OpLoad %70 
                                         f32 %177 = OpExtInst %1 10 %176 
                                Private f32* %179 = OpAccessChain %138 %178 
                                                      OpStore %179 %177 
                         read_only Texture2D %180 = OpLoad %156 
                                     sampler %181 = OpLoad %160 
                  read_only Texture2DSampled %182 = OpSampledImage %180 %181 
                                       f32_4 %183 = OpLoad %138 
                                       f32_2 %184 = OpVectorShuffle %183 %183 2 3 
                                       f32_4 %185 = OpImageSampleImplicitLod %182 %184 
                                         f32 %186 = OpCompositeExtract %185 1 
                                Private f32* %187 = OpAccessChain %9 %18 
                                                      OpStore %187 %186 
                                Private f32* %188 = OpAccessChain %9 %18 
                                         f32 %189 = OpLoad %188 
                                 Output f32* %191 = OpAccessChain %171 %14 
                                                      OpStore %191 %189 
                                 Output f32* %192 = OpAccessChain %171 %87 
                                                      OpStore %192 %72 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
""
}
SubProgram "vulkan " {
""
}
}
}
}
}